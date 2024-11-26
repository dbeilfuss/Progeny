//
//  SupplyItemListView.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/25/24.
//


//
//  SupplyItemListView.swift
//  Progeny
//
//  Created by [Your Name] on 11/25/24.
//

import SwiftUI

// MARK: - Main View
struct SupplyItemListView: View {
    // Supply Item List
    @State private var supplyItemList: [SupplyItem] = SupplyItemClass().supplyItemList
    @State var selectedSupplyItem: SupplyItem // Non-optional
    
    // Navigation Properties
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    // Item Properties
    @State var navigationTitle: String
    var listType: ListType = .supplyItems
    
    init(navigationTitle: String, listType: ListType = .supplyItems) {
        self.navigationTitle = navigationTitle
        // Provide a default supply item if the list is not empty
        if let firstSupplyItem = SupplyItemClass().supplyItemList.first {
            _selectedSupplyItem = State(initialValue: firstSupplyItem)
        } else {
            fatalError("Supply item list is empty. Ensure supplyItemList has at least one item.")
        }
    }
    
    var body: some View {
        if horizontalSizeClass == .regular {
            SupplyItemListViewiPad(supplyItemList: $supplyItemList, selectedSupplyItem: $selectedSupplyItem, navigationTitle: $navigationTitle)
        } else {
            SupplyItemListViewiPhone(supplyItemList: $supplyItemList, navigationTitle: $navigationTitle, selectedSupplyItem: $selectedSupplyItem)
        }
    }
}

// MARK: - iPad View
struct SupplyItemListViewiPad: View {
    // Supply Item List
    @Binding var supplyItemList: [SupplyItem]
    
    // Editor View
    @Binding var selectedSupplyItem: SupplyItem
    @Binding var navigationTitle: String
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    
    var isPortrait: Bool {
        UIDevice.current.orientation.isPortrait
    }
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            Divider()
                .padding(.horizontal)
                .padding(.vertical, 5)
            SupplyItemScrollView(supplyItemList: $supplyItemList, onTap: { supplyItem in
                if let selectedSupplyItem = supplyItemList.first(where: { $0.id == supplyItem.id }) {
                    self.selectedSupplyItem = selectedSupplyItem
                    
                    if isPortrait {
                        columnVisibility = .detailOnly
                    }
                }
            })
            .padding()
            AddPropertyButton(title: "Add Supply Item", icon: "plus") {
                let newSupplyItem = Semen(name: "New Semen", sire: "Unknown", count: 0, isAvailable: true)
                supplyItemList.append(newSupplyItem)
                selectedSupplyItem = newSupplyItem
                columnVisibility = .detailOnly
            }
        } detail: {
            NavigationStack {
                SupplyItemDetailView(supplyItem: selectedSupplyItem)
                    .navigationTitle(selectedSupplyItem.name)
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            columnVisibility = .all
        }
    }
}

// MARK: - iPhone View
struct SupplyItemListViewiPhone: View {
    // Supply Item List
    @Binding var supplyItemList: [SupplyItem]
    @Binding var navigationTitle: String
    
    // Editor View
    @Binding var selectedSupplyItem: SupplyItem
    @State private var showEditor = false
    @State private var isUserInitiatedSelection = false
    
    var body: some View {
        NavigationStack {
            Divider()
                .padding(.horizontal)
                .padding(.vertical, 5)
            SupplyItemScrollView(supplyItemList: $supplyItemList, onTap: { supplyItem in
                if let selectedSupplyItem = supplyItemList.first(where: { $0.id == supplyItem.id }) {
                    self.selectedSupplyItem = selectedSupplyItem
                    isUserInitiatedSelection = true
                }
            })
            .navigationTitle(navigationTitle)
            .onAppear {
                if supplyItemList.isEmpty {
                    fatalError("Supply item list is empty. Ensure it has at least one item.")
                }
                selectedSupplyItem = supplyItemList.first!
                isUserInitiatedSelection = false
            }
            .onChange(of: isUserInitiatedSelection) { _, _ in
                if isUserInitiatedSelection {
                    showEditor = true
                }
                isUserInitiatedSelection = false
            }
            .navigationDestination(isPresented: $showEditor) {
                SupplyItemDetailView(supplyItem: selectedSupplyItem)
            }
            AddPropertyButton(title: "Add Supply Item", icon: "plus") {
                let newSupplyItem = Semen(name: "New Semen", sire: "Unknown", count: 0, isAvailable: true)
                supplyItemList.append(newSupplyItem)
                selectedSupplyItem = newSupplyItem
                isUserInitiatedSelection = true
            }
        }
    }
}

// MARK: - Previews
#Preview {
    SupplyItemListView(navigationTitle: "Supply Items", listType: .supplyItems)
}
