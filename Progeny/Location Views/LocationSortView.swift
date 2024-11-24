//
//  LocationSortView.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/23/24.
//


import SwiftUI

struct LocationSortView: View {
    @Binding var originalLocationList: [Location]
    @Binding var sortedLocationList: [Location]
    @State private var sortOption: SortOption = .none
    @State private var lastOption: SortOption?
    
    var body: some View {
            VStack {
                // Sorting Buttons
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(SortOption.allCases, id: \.self) { option in
                            Button(action: {
                                sortAction(option: option, isUserInitiatedSelection: true)
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
                    sortedLocationList = sortLocationList(by: .none, for: originalLocationList, lastOption: lastOption)
                })
            }
            .onChange(of: originalLocationList) {
                sortAction(option: lastOption ?? .none, isUserInitiatedSelection: false)
            }
    }
    
    private func sortAction(option: SortOption, isUserInitiatedSelection: Bool) { sortOption = option
        sortedLocationList = sortLocationList(by: option, for: originalLocationList, lastOption: isUserInitiatedSelection ? lastOption : nil)
        lastOption = lastOption == option ? nil : sortOption
    }
    
    private func sortLocationList(by option: SortOption, for list: [Location], lastOption: SortOption?) -> [Location] {
        // Properties
        var sortedLocationList: [Location] = list

        // Sort
        switch option {
        case .none:
            sortedLocationList = list
        case .alphabetical:
            sortedLocationList.sort {
                $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending
            }
        }
        
        // Reverse as Needed
        if lastOption == option {
            sortedLocationList.reverse()
        }
        
        // Return
        return sortedLocationList
    }
    
    enum SortOption: String, CaseIterable {
        case none
        case alphabetical

        var displayName: String {
            switch self {
            case .none: return "None"
            case .alphabetical: return "A-Z"
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedItem: ListItem?
    LocationListView(navigationTitle: "List Scroll View", listType: .locations)
}
