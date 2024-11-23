//
//  AnimalEditorView.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/11/24.
//


import SwiftUI

struct AnimalEditorView: View {
    @ObservedObject var animal: Animal
    
    // State to track if a nil property field should be shown
    @State private var isAddingBreed: Bool = false
    @State private var isAddingLineage: Bool = false
    private var hasLineage: Bool {
        if animal.damID == nil && animal.sireID == nil && animal.surrogateDamID == nil && !isAddingLineage {
            return false
        } else {
            return true
        }
    }
    
    // Computed properties for each binding

    private var nameBinding: Binding<String> {
        Binding(
            get: { animal.name ?? "" },
            set: { animal.name = $0.isEmpty ? nil : $0 }
        )
    }
    
    private var breedBinding: Binding<String> {
        Binding(
            get: { animal.breed ?? "" },
            set: { animal.breed = $0.isEmpty ? nil : $0 }
        )
    }
    
    private var sexBinding: Binding<Sex> {
        Binding(
            get: { animal.sex },
            set: { animal.sex = $0 }
        )
    }
    
    private var birthDateBinding: Binding<Date> {
        Binding(
            get: { animal.birthDate ?? Date() },
            set: { animal.birthDate = $0 }
        )
    }
    
    private var purchaseDateBinding: Binding<Date> {
        Binding(
            get: { animal.purchaseDate ?? Date() },
            set: { animal.purchaseDate = $0 }
        )
    }
    
    private var sireIDBinding: Binding<String> {
        Binding(
            get: { animal.sireID ?? "" },
            set: { animal.sireID = $0 }
        )
    }
    
    var body: some View {
        Form {
            
            // General
            Section(header: Text("\(Constants().terms.animalNameSingular): \(animal.name ?? animal.visibleID)")) {
                TextField("ID", text: $animal.visibleID)
                TextField("Name", text: nameBinding)
                //                if isAddingBreed || animal.breed != nil {
                //                    TextField("Breed", text: breedBinding)
                //                }
                Picker("Sex", selection: sexBinding) {
                    ForEach(Sex.allCases, id: \.self) { sex in
                        Text(sex.rawValue).tag(sex)
                    }
                }
                
                DatePicker("Date of Birth", selection: birthDateBinding, displayedComponents: [.date]
                )
                
                DatePicker("Date of Purchase", selection: purchaseDateBinding, displayedComponents: [.date]
                )
            }
            
            // Breed
            if isAddingBreed || animal.breed != nil {
                Section(header: Text("Breed")) {
                    TextField("Breed", text: breedBinding)
                }
            }
            
            // Lineage
            if isAddingLineage || hasLineage {
                Section(header: Text("Lineage")) {
                    TextField("Sire", text: sireIDBinding)
                }
                
                Picker("Sire", selection: sireIDBinding) {
                    let possibleSires: [Animal] = AnimalClass().testAnimalList
                        .filter {
                        $0.sex == .male }
                        .filter {
                            $0.visibleID != animal.visibleID
                    }
                    
                    ForEach(possibleSires, id: \.id) { sire in
                        Text(sire.name ?? sire.visibleID ?? "Unknown").tag(sire.id) }
                }
                
            }
        
        // Add Sections
            if (animal.breed == nil && !isAddingBreed) || !hasLineage {
                Section(header: Text("Add Section")) {
                    if animal.breed == nil && !isAddingBreed {
                        AddPropertyButton(title: "Breed", icon: "plus") {
                            isAddingBreed = true
                        }
                    }
                    
                    if !hasLineage && !isAddingLineage {
                        AddPropertyButton(title: "Lineage", icon: "plus") {
                            isAddingLineage = true
                        }
                    }
                }
                .navigationTitle("Edit Animal")
            }
        }
    }
    
}



#Preview {
    @Previewable @State var previewAnimal: Animal = AnimalClass().testAnimalList[2]
    AnimalEditorView(animal: previewAnimal)
}
