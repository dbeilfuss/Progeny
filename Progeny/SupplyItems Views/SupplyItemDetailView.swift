//
//  SupplyItemDetailView.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/25/24.
//


//
//  SupplyItemDetailView.swift
//  Progeny
//
//  Created by [Your Name] on 11/25/24.
//

import SwiftUI

struct SupplyItemDetailView: View {
    @ObservedObject var supplyItem: SupplyItem
    
    var body: some View {
        Form {
            // Supply Item Overview Section
            Section(header: Text("Supply Item Details")) {
                HStack {
                    Text("Name")
                    Spacer()
                    Text(supplyItem.name)
                        .foregroundColor(.secondary)
                }
                
                Stepper("Count: \(supplyItem.count)", value: $supplyItem.count)
                
            }
            
            // Type-Specific Details
            if let semen = supplyItem as? Semen {
                Section(header: Text("Semen Details")) {
                    HStack {
                        Text("Sire")
                        Spacer()
                        Text(semen.sire)
                            .foregroundColor(.secondary)
                    }
                }
            } else if let embryo = supplyItem as? Embryo {
                Section(header: Text("Embryo Details")) {
                    HStack {
                        Text("Sire")
                        Spacer()
                        Text(embryo.sire)
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text("Dam")
                        Spacer()
                        Text(embryo.dam)
                            .foregroundColor(.secondary)
                    }
                }
            }
            
            // Button Section for Editing
            Section {
                NavigationLink(destination: SupplyItemEditorView(supplyItem: supplyItem)) {
                    Text("Edit Supply Item Details")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .navigationTitle("Supply Item Details")
    }
}

#Preview {
    @Previewable @State var previewSemen: SupplyItem = Semen(name: "Sample Semen", sire: "Top Bull", count: 10, isAvailable: true)
    @Previewable @State var previewEmbryo: SupplyItem = Embryo(name: "Sample Embryo", sire: "Top Bull", dam: "Elite Cow", count: 5, isAvailable: true)
    
    VStack {
        SupplyItemDetailView(supplyItem: previewSemen)
        Divider()
        SupplyItemDetailView(supplyItem: previewEmbryo)
    }
}
