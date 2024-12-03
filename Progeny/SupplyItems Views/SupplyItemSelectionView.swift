//
//  SupplyItemSelectionView.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 12/2/24.
//

import SwiftUI

struct SupplyItemSelectionView: View {
    
    @Binding var isPresented: Bool
    var onSelect: (String) -> Void
    
    var c = globalStyleSheet.colors
    private var p: ButtonParameters { ListType.supplyItems.parameters }
    
    // Hardcoded options for Supply Items
    private var options: [String] { ["Semen", "Embryo"] }
    
    var body: some View {
        VStack(spacing: 20) {
            // Header Section
            HStack {
                HStack {
                    Button("Cancel") {
                        isPresented = false
                    }
                    .font(.body)
                    .foregroundStyle(c.primary)
                    .padding(.leading, 30)
                    Spacer()
                }
                .alignmentGuide(HorizontalAlignment.leading) { _ in 0 }
                .frame(width: UIScreen.main.bounds.width / 3)
                
                Spacer()
                
                Text("Add Supply Item")
                    .font(.headline)
                    .frame(width: UIScreen.main.bounds.width / 3)
                
                HStack {
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width / 3)
                
            }
            
            Spacer()
            
            // Supply Item Options
            ForEach(options, id: \.self) { option in
                Button {
                    onSelect(option)
                } label: {
                    PrimaryTextOverlay(p: ButtonParameters(
                        title: option,
                        buttonType: p.buttonType,
                        layout: .centerText,
                        height: p.height,
                        isSelected: false,
                        requiresSubscription: true,
                        activeSubscription: true
                    ))
                    .padding()
                    .frame(height: p.heightNum)
                    .foregroundColor(c.fontColorHighlighted)
                }
                .frame(maxWidth: UIScreen.main.bounds.width * p.maxWidthRatio)
                .background(alignment: .center) {
                    RoundedRectangle(cornerRadius: p.cornerRadius)
                        .stroke(Color.black, lineWidth: p.buttonAppearance.borderWidth)
                        .background(c.primary)
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
        @Previewable @State var isPresented: Bool = true
        
        SupplyItemSelectionView(isPresented: $isPresented) { selectedOption in
            testFunction(selectedItem: selectedOption)
        }
    }
    
    func testFunction(selectedItem: SupplyItem) {
        print("Selected Item: \(selectedItem.name)")
    }
