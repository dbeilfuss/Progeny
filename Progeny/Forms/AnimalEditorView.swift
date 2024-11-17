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

    // Computed properties for each binding
    private var visibleIDBinding: Binding<String> {
        Binding(
            get: { animal.visibleID ?? "" },
            set: { animal.visibleID = $0.isEmpty ? nil : $0 }
        )
    }
    
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
    
    var body: some View {
        Form {
            Section(header: Text("\(Constants().terms.animalNameSingular): \(animal.name ?? animal.visibleID ?? "")")) {
                TextField("ID", text: visibleIDBinding)
                TextField("Name", text: nameBinding)
                if isAddingBreed || animal.breed != nil {
                    TextField("Breed", text: breedBinding)
                }
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
            
            Section {
                if animal.breed == nil && !isAddingBreed {
                    AddPropertyButton(title: "Add Breed", icon: "plus") {
                        isAddingBreed = true
                    }
                }
            }
        }
        .navigationTitle("Edit Animal")
        //    } else {
        //        Text("Select an animal to see details")
        //    }
    }
    
}

struct AddPropertyButton: View {
    var title: String
    var icon: String
    var onTap: () -> Void
    let listType: ListType = .hyperlinks
    private var p: ButtonParameters { listType.parameters }
    var body: some View {
        Button {
            onTap()
        } label: {
            HyperlinkTextOverlay(p: ButtonParameters(
                title: title,
                data: nil,
                icon: icon,
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


#Preview {
    @Previewable @State var previewAnimal: Animal = AnimalClass().testAnimalList[2]
    AnimalEditorView(animal: previewAnimal)
}
