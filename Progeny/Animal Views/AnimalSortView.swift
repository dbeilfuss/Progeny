//
//  AnimalSortView.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/19/24.
//

import SwiftUI

struct AnimalSortView: View {
    @State var originalAnimalList: [Animal]
    @Binding var sortedAnimalList: [Animal]
    @State private var sortOption: SortOption = .none
    
    
    var body: some View {
            VStack {
                // Sorting Buttons
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(SortOption.allCases, id: \.self) { option in
                            Button(action: {
                                sortOption = option
                                sortedAnimalList = sortAnimalList(by: option, for: originalAnimalList)
                            }) {
                                Text(option.displayName)
                                    .padding()
                                    .background(sortOption == option ? Color.blue : Color.gray.opacity(0.3))
                                    .cornerRadius(8)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .onAppear(perform: {
                    sortedAnimalList = sortAnimalList(by: .none, for: originalAnimalList)
                })
            }
        }
    
    private func sortAnimalList(by option: SortOption, for list: [Animal]) -> [Animal] {
        var sortedAnimalList: [Animal] = list
        print("All Sorted Cows: \(sortedAnimalList.compactMap( { $0.id.uuidString }))")
        print("All Original Cows: \(list.compactMap( { $0.id.uuidString }))")
        switch option {
        case .none:
            sortedAnimalList = list
        case .alphabetical:
            sortedAnimalList.sort { ($0.name ?? "").localizedCaseInsensitiveCompare($1.name ?? "") == .orderedAscending }
        case .bySex:
            sortedAnimalList.sort { (a: Animal, b: Animal) in
                (a.sex.rawValue).localizedCaseInsensitiveCompare(b.sex.rawValue) == .orderedAscending }
        }
        
        print("All Sorted Cows: \(sortedAnimalList.compactMap( { $0.id.uuidString }))")
        print("All Original Cows: \(list.compactMap( { $0.id.uuidString }))")
        
        return sortedAnimalList
    }
    
    enum SortOption: String, CaseIterable {
        case none
        case alphabetical
        case bySex

        var displayName: String {
            switch self {
            case .none: return "None"
            case .alphabetical: return "A-Z"
            case .bySex: return "Sex"
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedItem: ListItem?
    AnimalListView(navigationTitle: "List Scroll View", listType: .animals)
}
