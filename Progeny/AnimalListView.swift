//
//  ListScrollView.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/9/24.
//


import SwiftUI

struct AnimalListView: View {
    // Animal List
    @State private var animalList: [Animal] = AnimalClass().testAnimalList
    @State var selectedAnimal: Animal?

    // Navigation Properties
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    // Item Properties
    @State var navigationTitle: String
    var listType: ListType = .animals
    
    // Parameters
    
    var body: some View {
        if horizontalSizeClass == .regular {
            AnimalListViewiPad(animalList: $animalList, selectedAnimal: $selectedAnimal, navigationTitle: $navigationTitle)
        } else {
            AnimalListViewiPhone(animalList: $animalList, selectedAnimal: $selectedAnimal, navigationTitle: $navigationTitle)
        }
    }
}

struct AnimalScrollView: View {
    @Binding var animalList: [Animal]
    @Binding var selectedAnimal: Animal?

    // Button Properties
    var listType: ListType = .animals
    private var p: ButtonParameters { listType.parameters }

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(animalList, id: \.id) { animal in
                    Button() {
                        print("clicked")
                        print(animal.name ?? "no name")
                        
                        selectedAnimal = animal
                        print(selectedAnimal!)
                        
                    } label: {
                        
                        let listItem: ListItem = animal.listItem()
                        
                        PrimaryTextOverlay(p: ButtonParameters(
                            title: listItem.name,
                            data: listItem.data,
                            icon: listItem.icon,
                            buttonType: p.buttonType, layout: p.layout, height: p.height, isSelected: false,
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
    @Binding var selectedAnimal: Animal?
    @Binding var navigationTitle: String
    @State private var columnVisibility = NavigationSplitViewVisibility.all

    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            AnimalScrollView(animalList: $animalList, selectedAnimal: $selectedAnimal)
        } detail: {
            if let selectedAnimal = selectedAnimal {
                AnimalEditorView(animal: $selectedAnimal)
            } else {
                Text("Select an animal to see details")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AnimalListViewiPhone: View {
    @Binding var animalList: [Animal]
    @Binding var selectedAnimal: Animal?
    @Binding var navigationTitle: String
    @State private var showEditor = false
    
    var body: some View {
        NavigationStack {
                    AnimalScrollView(animalList: $animalList, selectedAnimal: $selectedAnimal)
                        .navigationTitle(navigationTitle)
                        .onChange(of: selectedAnimal) { oldAnimal, newAnimal in
                            showEditor = newAnimal != nil
                        }
                        .navigationDestination(isPresented: $showEditor) {
                            if let selectedAnimal = selectedAnimal {
                                AnimalEditorView(animal: Binding(
                                    get: { selectedAnimal },
                                    set: { newAnimal in
                                        if let newAnimal, let index = animalList.firstIndex(where: { $0.id == newAnimal.id }) {
                                            animalList[index] = newAnimal
                                        }
                                    }
                                ))
                            } else {
                                Text("No Animal Selected")
                            }
                        }
                }
        }
}


#Preview {
    @Previewable @State var selectedItem: ListItem?
    AnimalListView(navigationTitle: "List Scroll View", listType: .animals)
}
