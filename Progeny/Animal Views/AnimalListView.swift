//
//  ListScrollView.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/9/24.
//


import SwiftUI

//MARK: - MainView
struct AnimalListView: View {
    // Animal List
    @State private var animalList: [Animal] = AnimalClass().testAnimalList
    @State var selectedAnimal: Animal // Non-optional
    
    // Navigation Properties
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    // Item Properties
    @State var navigationTitle: String
    var listType: ListType = .animals
    
    init(navigationTitle: String, listType: ListType = .animals) {
        self.navigationTitle = navigationTitle
        // Provide a default animal if the list is not empty
        if let firstAnimal = AnimalClass().testAnimalList.first {
            _selectedAnimal = State(initialValue: firstAnimal)
        } else {
            fatalError("Animal list is empty. Ensure testAnimalList has at least one item.")
        }
    }
    
    var body: some View {
        if horizontalSizeClass == .regular {
            AnimalListViewiPad(animalList: $animalList, selectedAnimal: $selectedAnimal, navigationTitle: $navigationTitle)
        } else {
            AnimalListViewiPhone(animalList: $animalList, navigationTitle: $navigationTitle, selectedAnimal: $selectedAnimal)
        }
    }
}

//MARK: - iPad

struct AnimalListViewiPad: View {
    @Binding var animalList: [Animal]
    @State private var sortedAnimalList: [Animal] = [Animal(sex: .unknown, status: .inactive(date: Date()))]
    @Binding var selectedAnimal: Animal
    @Binding var navigationTitle: String
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    
    var isPortrait: Bool {
        UIDevice.current.orientation.isPortrait
    }
    
    var body: some View {
        
        NavigationSplitView(columnVisibility: $columnVisibility) {
            AnimalSortView(originalAnimalList: $animalList, sortedAnimalList: $sortedAnimalList)
            Divider()
                .padding(.horizontal)
                .padding(.vertical, 5)
            AnimalScrollView(animalList: $sortedAnimalList, onTap: { animal in
                if let selectedAnimal = animalList.first(where: { $0.id == animal.id }) { // Fetch the Animal
                    self.selectedAnimal = selectedAnimal // Pass the Animal
                    
                    if isPortrait {
                        columnVisibility = .detailOnly  // Adjust the Column
                    }
                }
            })
            .padding()
            
            AddPropertyButton(title: "Add \(Constants().terms.animalNameSingular)", icon: "plus") {
                let newAnimal = Animal(sex: .female, status: .active)
                animalList.append(newAnimal)
            }

        } detail: {
            NavigationStack() {
                AnimalDetailView(animal: selectedAnimal)
                    .navigationTitle(selectedAnimal.name ?? "Animal Details")
                    .navigationBarTitleDisplayMode(.inline)
            }
            
        }
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            columnVisibility = .all
        }
    }
}

//MARK: - iPhone
struct AnimalListViewiPhone: View {
    // Animal List
    @Binding var animalList: [Animal]
    @State private var sortedAnimalList: [Animal] = [Animal(sex: .unknown, status: .inactive(date: Date()))]
    @Binding var navigationTitle: String
    
    // Editor View
    @Binding var selectedAnimal: Animal
    @State private var showEditor = false
    @State private var isUserInitiatedSelection = false
    
    // Add Animal View
    @State private var showAnimalTypeSelection = false
    
    var body: some View {
        NavigationStack {
            AnimalSortView(originalAnimalList: $animalList, sortedAnimalList: $sortedAnimalList)
            Divider()
                .padding(.horizontal)
                .padding(.vertical, 5)
            AnimalScrollView(animalList: $sortedAnimalList, onTap: { animal in
                if let selectedAnimal = animalList.first(where: { $0.id == animal.id }) { // Fetch the Animal
                    
                    self.selectedAnimal = selectedAnimal // Pass the Animal
                    isUserInitiatedSelection = true
                }
            })
            .navigationTitle(navigationTitle)
            .onAppear {
                if animalList.isEmpty {
                    fatalError("Animal list is empty. Ensure it has at least one item.")
                }
                selectedAnimal = animalList.first!
                isUserInitiatedSelection = false
            }
            .onChange(of: isUserInitiatedSelection) { _, _ in
                if isUserInitiatedSelection {
                    showEditor = true
                }
                isUserInitiatedSelection = false
            }
            .navigationDestination(isPresented: $showEditor) {
                AnimalDetailView(animal: selectedAnimal)
            }
            AddPropertyButton(title: "Add \(Constants().terms.animalNameSingular)", icon: "plus") {
                showAnimalTypeSelection = true
            }
            .sheet(isPresented: $showAnimalTypeSelection) {
                AnimalTypeSelectionView(isPresented: $showAnimalTypeSelection) { selectedType in
                    // Use selectedType if needed in the future
                    let newAnimal = Animal(sex: .female, status: .active)
                    animalList.append(newAnimal)
                    showAnimalTypeSelection = false
                    selectedAnimal = newAnimal
                    isUserInitiatedSelection = true
                }
            }
        }
    }
}


#Preview {
    @Previewable @State var selectedItem: ListItem?
    AnimalListView(navigationTitle: "List Scroll View", listType: .animals)
}
