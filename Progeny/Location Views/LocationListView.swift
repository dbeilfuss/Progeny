//
//  LocationListView.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/23/24.
//


import SwiftUI

//MARK: - MainView
struct LocationListView: View {
    // Location List
    @State private var locationList: [Location] = LocationClass().testLocationList
    @State var selectedLocation: Location // Non-optional
    
    // Navigation Properties
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    // Item Properties
    @State var navigationTitle: String
    var listType: ListType = .locations
    
    init(navigationTitle: String, listType: ListType = .locations) {
        self.navigationTitle = navigationTitle
        // Provide a default location if the list is not empty
        if let firstLocation = LocationClass().testLocationList.first {
            _selectedLocation = State(initialValue: firstLocation)
        } else {
            fatalError("Location list is empty. Ensure testLocationList has at least one item.")
        }
    }
    
    var body: some View {
        if horizontalSizeClass == .regular {
            LocationListViewiPad(locationList: $locationList, selectedLocation: $selectedLocation, navigationTitle: $navigationTitle)
        } else {
            LocationListViewiPhone(locationList: $locationList, navigationTitle: $navigationTitle, selectedLocation: $selectedLocation)
        }
    }
}

//MARK: - iPad

struct LocationListViewiPad: View {
    // Location List
    @Binding var locationList: [Location]
    
    // Editor View
    @Binding var selectedLocation: Location
    @Binding var navigationTitle: String
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    
    // Add Location View
    @State private var showLocationTypeSelection = false
    
    var isPortrait: Bool {
        UIDevice.current.orientation.isPortrait
    }
    
    var body: some View {
        
        NavigationSplitView(columnVisibility: $columnVisibility) {
            Divider()
                .padding(.horizontal)
                .padding(.vertical, 5)
            LocationScrollView(locationList: $locationList, onTap: { location in
                if let selectedLocation = locationList.first(where: { $0.id == location.id }) {
                    self.selectedLocation = selectedLocation
                    
                    if isPortrait {
                        columnVisibility = .detailOnly
                    }
                }
            })
            .padding()
            AddPropertyButton(title: "Add Location", icon: "plus") {
                let newLocation = Location(
                    name: "New Location",
                    coordinates: nil,
                    address: nil,
                    description: "No description provided.",
                    photo: nil,
                    animals: nil,
                    isPinned: false
                )
                locationList.append(newLocation)
                showLocationTypeSelection = false
                selectedLocation = newLocation
                columnVisibility = .detailOnly
            }

        } detail: {
            NavigationStack() {
                LocationDetailView(location: selectedLocation)
                    .navigationTitle(selectedLocation.name)
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

//MARK: - iPhone
struct LocationListViewiPhone: View {
    // Location List
    @Binding var locationList: [Location]
    @Binding var navigationTitle: String
    
    // Editor View
    @Binding var selectedLocation: Location
    @State private var showEditor = false
    @State private var isUserInitiatedSelection = false
    
    // Add Location View
    @State private var showLocationTypeSelection = false
    
    var body: some View {
        NavigationStack {
            Divider()
                .padding(.horizontal)
                .padding(.vertical, 5)
            LocationScrollView(locationList: $locationList, onTap: { location in
                if let selectedLocation = locationList.first(where: { $0.id == location.id }) { // Fetch the Location
                    
                    self.selectedLocation = selectedLocation // Pass the Location
                    isUserInitiatedSelection = true
                }
            })
            .navigationTitle(navigationTitle)
            .onAppear {
                if locationList.isEmpty {
                    fatalError("Location list is empty. Ensure it has at least one item.")
                }
                selectedLocation = locationList.first!
                isUserInitiatedSelection = false
            }
            .onChange(of: isUserInitiatedSelection) { _, _ in
                if isUserInitiatedSelection {
                    showEditor = true
                }
                isUserInitiatedSelection = false
            }
            .navigationDestination(isPresented: $showEditor) {
                LocationDetailView(location: selectedLocation)
            }
            AddPropertyButton(title: "Add Location", icon: "plus") {
                let newLocation = Location(
                    name: "New Location",
                    coordinates: nil,
                    address: nil,
                    description: "No description provided.",
                    photo: nil,
                    animals: nil,
                    isPinned: false
                )
                locationList.append(newLocation)
                selectedLocation = newLocation
                isUserInitiatedSelection = true
            }
        }
    }
}


#Preview {
    @Previewable @State var selectedItem: ListItem?
    LocationListView(navigationTitle: "List Scroll View", listType: .locations)
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
