//
//  SupplyItemScrollView.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/25/24.
//


//
//  SupplyItemScrollView.swift
//  Progeny
//
//  Created by [Your Name] on 11/25/24.
//

import SwiftUI

struct SupplyItemScrollView: View {
    @Binding var supplyItemList: [SupplyItem]
    var onTap: (SupplyItem) -> Void

    var listType: ListType = .supplyItems
    private var p: ButtonParameters { listType.parameters }

    var body: some View {
        ScrollView {
            VStack(spacing: -1) {
                ForEach(supplyItemList, id: \.id) { supplyItem in
                    Button {
                        onTap(supplyItem)
                    } label: {
                        let listItem: ListItem = ListItem(from: supplyItem)
                        PrimaryTextOverlay(p: ButtonParameters(
                            title: supplyItem.name.isEmpty ? "Unnamed Item" : supplyItem.name,
                            data: typeSpecificDetails(for: supplyItem),
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

    /// Returns type-specific details for a supply item to display.
    private func typeSpecificDetails(for supplyItem: SupplyItem) -> String {
        if let semen = supplyItem as? Semen {
            return "Sire: \(semen.sire)"
        } else if let embryo = supplyItem as? Embryo {
            return "Sire: \(embryo.sire), Dam: \(embryo.dam)"
        } else {
            return "Count: \(supplyItem.count)"
        }
    }
}

// MARK: - Previews
#Preview {
    SupplyItemListView(navigationTitle: "Supply Items", listType: .supplyItems)
}
