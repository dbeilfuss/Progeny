//
//  ContentView.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/2/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var selectedContent: String? = "Herd"

    var body: some View {
        TabbedContentView(selectedContent: $selectedContent)
    }
    
}

struct TabbedContentView: View {
    @Binding var selectedContent: String?
    @State private var selectedDetail: ListItem?
    @State private var columnVisibility: NavigationSplitViewVisibility = .doubleColumn
    
    private var animalIcon: String { Constants().animalIcon }
    private var animalName: String { Constants().terms.animalNamePlural }
    
    var body: some View {
        TabView(selection: $selectedContent) {
            AnimalListView(navigationTitle: animalName, listType: .animals)                .tabItem {
                Image(animalIcon + "24")
                    .renderingMode(.template)
            }
            AnimalListView(navigationTitle: "Locations", listType: .locations)
                .tabItem { Image(systemName: "location") }
            AnimalListView(navigationTitle: "Supplies", listType: .supplies)
                .tabItem { Image(systemName: "pencil.and.list.clipboard") }
        }
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
