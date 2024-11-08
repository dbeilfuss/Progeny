//
//  ContentView.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/2/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var selectedOption: String? = "Herd"
    
    let options: [String] = ["Herd", "Locations"]
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedOption) {
                ForEach(options, id: \.self) { item in
                    NavigationLink(
                        value: item,
                        label: { Text(item) }
                    )
                }
            }
        } detail: {
            if selectedOption == "Herd" {
                TestScrollView(itemList: optionList)
            } else if selectedOption == "Locations" {
                TestScrollView(itemList: locationList)
            } else {
                Text("Select an option")
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}



//struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [Item]
//
//    var body: some View {
//        TestScrollView()
//        NavigationSplitView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//        } detail: {
//            Text("Select an item")
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
//}
