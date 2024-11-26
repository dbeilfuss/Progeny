//
//  SupplyItemEditorView.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/25/24.
//

import SwiftUI

struct SupplyItemEditorView: View {
    @ObservedObject var supplyItem: SupplyItem
    
    // Computed bindings for each property
    private var nameBinding: Binding<String> {
        Binding(
            get: { supplyItem.name },
            set: { supplyItem.name = $0 }
        )
    }
    
    private var availabilityBinding: Binding<Bool> {
        Binding(
            get: { supplyItem.isAvailable },
            set: { supplyItem.isAvailable = $0 }
        )
    }
    
    // Specific properties for Semen and Embryo
    private var sireBinding: Binding<String>? {
        if let semen = supplyItem as? Semen {
            return Binding(
                get: { semen.sire },
                set: { semen.sire = $0 }
            )
        } else if let embryo = supplyItem as? Embryo {
            return Binding(
                get: { embryo.sire },
                set: { embryo.sire = $0 }
            )
        }
        return nil
    }
    
    private var damBinding: Binding<String>? {
        if let embryo = supplyItem as? Embryo {
            return Binding(
                get: { embryo.dam },
                set: { embryo.dam = $0 }
            )
        }
        return nil
    }
    
    var body: some View {
        Form {
            // General Information Section
            Section(header: Text("Supply Item Details")) {
                TextField("Name", text: nameBinding)
                Toggle("Available", isOn: availabilityBinding)
            }
            
            // Specific Properties Section
            Section(header: Text("Specific Details")) {
                if let sireBinding = sireBinding {
                    TextField("Sire", text: sireBinding)
                }
                if let damBinding = damBinding {
                    TextField("Dam", text: damBinding)
                }
            }
        }
        .navigationTitle("Edit Supply Item")
    }
}

#Preview {
    @Previewable @State var previewSemen: SupplyItem = Semen(name: "Sample Semen", sire: "Top Bull", count: 10, isAvailable: true)
    @Previewable @State var previewEmbryo: SupplyItem = Embryo(name: "Sample Embryo", sire: "Top Bull", dam: "Elite Cow", count: 5, isAvailable: true)
    VStack {
        SupplyItemEditorView(supplyItem: previewSemen)
        Divider()
        SupplyItemEditorView(supplyItem: previewEmbryo)
    }
}
