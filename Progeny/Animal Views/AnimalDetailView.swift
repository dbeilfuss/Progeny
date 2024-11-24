//
//  AnimalDetailView.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/16/24.
//

import SwiftUI

struct AnimalDetailView: View {
    @ObservedObject var animal: Animal

    var body: some View {
        Form {
            Section(header: Text("\(Constants().terms.animalNameSingular): \(animal.name ?? animal.visibleID)")) {
                HStack {
                    Text("ID")
                    Spacer()
                    Text(animal.visibleID)
                        .foregroundColor(.secondary)
                }

                HStack {
                    Text("Name")
                    Spacer()
                    Text(animal.name ?? "N/A")
                        .foregroundColor(.secondary)
                }

                if let breed = animal.breed {
                    HStack {
                        Text("Breed")
                        Spacer()
                        Text(breed)
                            .foregroundColor(.secondary)
                    }
                }

                HStack {
                    Text("Sex")
                    Spacer()
                    Text(animal.sex.rawValue)
                        .foregroundColor(.secondary)
                }

                if let birthDate = animal.birthDate {
                    HStack {
                        Text("Date of Birth")
                        Spacer()
                        Text(format(date: birthDate))
                            .foregroundColor(.secondary)
                    }
                }

                if let purchaseDate = animal.purchaseDate {
                    HStack {
                        Text("Date of Purchase")
                        Spacer()
                        Text(format(date: purchaseDate))
                            .foregroundColor(.secondary)
                    }
                }
            }
            
            // Button Section for editing
            Section {
                NavigationLink(destination: AnimalEditorView(animal: animal)) {
                    Text("Edit Animal Details")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .navigationTitle("Animal Details")
    }
    
    // Helper function to format dates
    private func format(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

#Preview {
    @Previewable @State var previewAnimal: Animal = AnimalClass().testAnimalList[2]
    AnimalDetailView(animal: previewAnimal)
}
