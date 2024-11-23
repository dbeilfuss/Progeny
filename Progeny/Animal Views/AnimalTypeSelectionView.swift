//
//  AnimalTypeSelectionView.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/21/24.
//

import SwiftUI

struct AnimalTypeSelectionView: View {
    var t = Constants().terms
    var s = globalStyleSheet
    private var p: ButtonParameters { ListType.animals.parameters }
    private var options: [String] { ["Adult", "\(t.animalBabyName)"] }

    @Binding var isPresented: Bool
    var onSelect: (String) -> Void
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                HStack {
                    Button("Cancel") {
                        isPresented = false
                    }
                    .font(.body)
                    .foregroundStyle(s.colors.primary)
                    .padding(.leading, 30)
                    Spacer()
                }
                .alignmentGuide(HorizontalAlignment.leading) { _ in 0 }
                .frame(width: UIScreen.main.bounds.width / 3)

                Spacer()
                
                Text("Add \(t.animalNameSingular)")
                    .font(.headline)
                    .frame(width: UIScreen.main.bounds.width / 3)
                
                HStack {
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width / 3)


            }

            Spacer()
            
            ForEach(options, id: \.self) { option in
                Button() {
                    onSelect(option)
                } label: {
                    PrimaryTextOverlay(p: ButtonParameters(
                        title: (option),
                        buttonType: p.buttonType,
                        layout: .centerText,
                        height: p.height,
                        isSelected: false,
                        requiresSubscription: true,
                        activeSubscription: true
                    ))
                    .padding()
                    .frame(height: p.heightNum)
                    .foregroundColor(s.colors.fontColorHighlighted)
                }
                .frame(maxWidth: UIScreen.main.bounds.width * p.maxWidthRatio)
                .background(alignment: .center) {
                    RoundedRectangle(cornerRadius: p.cornerRadius)
                        .stroke(Color.black, lineWidth: p.buttonAppearance.borderWidth)
                        .background(s.colors.primary)
                        .cornerRadius(p.cornerRadius)
                        .shadow(radius: p.buttonAppearance.shadowRadius)
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var selectedItem: ListItem?
    @Previewable @State var isPresented: Bool = true
    
    AnimalTypeSelectionView(isPresented: $isPresented) { selectedType in
        testFunction(selectedItem: selectedType)
    }
}

func testFunction(selectedItem: String) {
    print(selectedItem)
}
