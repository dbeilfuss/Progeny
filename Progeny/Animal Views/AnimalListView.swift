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
            AnimalListViewiPhone(animalList: $animalList, selectedAnimal: $selectedAnimal, navigationTitle: $navigationTitle)
        }
    }
}

//MARK: - SubViews


struct AnimalScrollView: View {
    @Binding var animalList: [Animal]
    var onTap: (Animal) -> Void
    
    var listType: ListType = .animals
    private var p: ButtonParameters { listType.parameters }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(animalList, id: \.id) { animal in
                    Button {
                        onTap(animal)
                    } label: {
                        let listItem: ListItem = ListItem(from: animal)
                        PrimaryTextOverlay(p: ButtonParameters(
                            title: (listItem.name == "" ? listItem.data : listItem.name) ?? "No ID",
                            data: listItem.data,
                            icon: listItem.icon,
                            buttonType: p.buttonType,
                            layout: p.layout,
                            height: p.height,
                            isSelected: false,
                            requiresSubscription: true,
                            activeSubscription: true
                        ))
                        .padding()
                        .frame(height: p.heightNum)
                        .foregroundColor(p.computedForegroundColor)
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width * p.maxWidthRatio)
                    .background(alignment: .center) {
                        RoundedRectangle(cornerRadius: p.cornerRadius)
                            .stroke(Color.black, lineWidth: p.buttonAppearance.borderWidth)
                            .background(p.computedBackgroundColor)
                            .cornerRadius(p.cornerRadius)
                            .shadow(radius: p.buttonAppearance.shadowRadius)
                    }
                }
            }
        }
    }
}

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
            AnimalSortView(originalAnimalList: animalList, sortedAnimalList: $sortedAnimalList)
            Divider()
                .padding(.horizontal)
                .padding(.vertical, 5)
            AnimalScrollView(animalList: $sortedAnimalList, onTap: { animal in
                if let selectedAnimal = animalList.first(where: { $0.id == animal.id }) { // Fetch the Animal
                    print("found")
                    self.selectedAnimal = selectedAnimal // Pass the Animal
                    
                    if isPortrait {
                        columnVisibility = .detailOnly  // Adjust the Column
                    }
                } else {
                    print("not found: \(animal.id.uuidString)")
                    print("Kojak ID Sorted: \(sortedAnimalList.first(where: { $0.name == "Kojak" })?.id.uuidString ?? "Not Found")")
                    print("Kojak ID Original: \(animalList.first(where: { $0.name == "Kojak" })?.id.uuidString ?? "Not Found"))")
                    let newKojak: Animal = animalList.first(where: { $0.name == "Kojak" })!
                    print("Kojak ID New: \(newKojak.id.uuidString)")
                    print("All Sorted Cows: \(sortedAnimalList.compactMap( { $0.id.uuidString }))")
                    print("All Original Cows: \(animalList.compactMap( { $0.id.uuidString }))")

                }
            })
            .padding()
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

struct AnimalListViewiPhone: View {
    @Binding var animalList: [Animal]
    @State private var sortedAnimalList: [Animal] = [Animal(sex: .unknown, status: .inactive(date: Date()))]
    @Binding var selectedAnimal: Animal
    @Binding var navigationTitle: String
    @State private var showEditor = false
    @State private var isUserInitiatedSelection = false
    
    var body: some View {
        NavigationStack {
            AnimalSortView(originalAnimalList: animalList, sortedAnimalList: $sortedAnimalList)
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
        }
    }
}

//MARK: - Helper Functions

struct AnimalEditorBinding {
    static func binding(for animalList: Binding<[Animal]>, selectedAnimal: Binding<Animal?>) -> Binding<Animal?> {
        Binding(
            get: { selectedAnimal.wrappedValue },
            set: { newAnimal in
                if let newAnimal, let index = animalList.wrappedValue.firstIndex(where: { $0.id == newAnimal.id }) {
                    animalList.wrappedValue[index] = newAnimal
                }
            }
        )
    }
}


#Preview {
    @Previewable @State var selectedItem: ListItem?
    AnimalListView(navigationTitle: "List Scroll View", listType: .animals)
}
