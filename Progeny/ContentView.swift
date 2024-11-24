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
    @State private var tabSelection: Int = 1
    
    private var animalIcon: String { Constants().animalIcon }
    private var animalName: String { Constants().terms.animalNamePlural }
    
    var body: some View {
        TabView(selection: $tabSelection) {
            AnimalListView(navigationTitle: animalName, listType: .animals)
                .tabItem {
                    Image(animalIcon + "24")
                        .renderingMode(.template)
                }
                .tag(1)
                .padding(.bottom, 10)

            LocationListView(navigationTitle: "Locations", listType: .locations)
                .tabItem {
                    Image(systemName: "location")
                }
                .tag(2)
                .padding(.bottom, 10)

            AnimalListView(navigationTitle: "Supplies", listType: .supplies)
                .tabItem {
                    Image(systemName: "pencil.and.list.clipboard")
                }
                .tag(3)
                .padding(.bottom, 10)

        }

    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
