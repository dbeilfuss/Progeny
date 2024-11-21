//
//  AnimalScrollView.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/21/24.
//

import SwiftUI

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


//MARK: - Helper Functions
//struct AnimalEditorBinding {  // Not used at this time
//    static func binding(for animalList: Binding<[Animal]>, selectedAnimal: Binding<Animal?>) -> Binding<Animal?> {
//        Binding(
//            get: { selectedAnimal.wrappedValue },
//            set: { newAnimal in
//                if let newAnimal, let index = animalList.wrappedValue.firstIndex(where: { $0.id == newAnimal.id }) {
//                    animalList.wrappedValue[index] = newAnimal
//                }
//            }
//        )
//    }
//}
