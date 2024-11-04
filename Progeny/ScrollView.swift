//
//  ScrollView.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/2/24.
//

import SwiftUI

let optionList: [ListItem] = [
    ListItem(name: "Herd", icon: "CowIcon"),
    ListItem(name: "Supplies", icon: "bag.fill"),
    ListItem(name: "Users", icon: "person.fill"),
    ListItem(name: "Breeding Event", icon: "plus"),
    ListItem(name: "Creature", icon: "cat.fill"),
    ListItem(name: "Settings", icon: "gear")
]

let cowList: [ListItem] = [
    ListItem(name: "Milky", icon: "CowIcon"),
    ListItem(name: "Patches", icon: "CowIcon"),
    ListItem(name: "High Five", icon: "CowIcon"),
    ListItem(name: "C0112", icon: "CowIcon"),
    ListItem(name: "Hooves", icon: "CowIcon")
]

struct ListItem: Hashable {
    let name: String
    let icon: String?
}

struct TestScrollView: View {
    var body: some View {
        // Parameters
        let itemList: [ListItem] = optionList
        let buttonType: ButtonType = .cell
        let layout: ButtonLayout = .textLeftAlligned
        let buttonHeight: ButtonHeight = .tall
        
        // ScrollView
        ScrollView {
            VStack(spacing: 0) {
                ForEach(itemList, id: \.self) { item in
                    CustomButton(title: item.name, data: "19", icon: item.icon, buttonType: buttonType, layout: layout, height: buttonHeight, action: testAction)
                }
            }
        }
        .frame(width: .infinity, height: .infinity)
    }
}

#Preview {
    TestScrollView()
}
