//
//  ScrollView.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/2/24.
//

import SwiftUI

let optionList: [ListItem] = [
    ListItem(name: "Herd", icon: "CowIcon", data: nil),
    ListItem(name: "Supplies", icon: "tag", data: nil),
    ListItem(name: "Users", icon: "pin", data: nil),
    ListItem(name: "Breeding Event", icon: "plus", data: nil),
    ListItem(name: "Creature", icon: "minus", data: nil),
    ListItem(name: "Settings", icon: "gear", data: nil)
]

let cowList: [ListItem] = [
    ListItem(name: "Milky", icon: "CowIcon", data: nil),
    ListItem(name: "Patches", icon: "CowIcon", data: nil),
    ListItem(name: "High Five", icon: "CowIcon", data: nil),
    ListItem(name: "C0112", icon: "CowIcon", data: nil),
    ListItem(name: "Hooves", icon: "CowIcon", data: nil)
]

let supplyList: [ListItem] = [
    ListItem(name: "Encore", icon: "CowIcon", data: "5"),
    ListItem(name: "Bedrock", icon: "CowIcon", data: "4"),
    ListItem(name: "Comeback Kid", icon: "cat.fill", data: "0"),
    ListItem(name: "Gold Buckle", icon: "dog.fill", data: "12")
]

let purchaseList: [ListItem] = [
    ListItem(name: "Weekly", icon: "calendar.circle", data: "$5"),
    ListItem(name: "Monthly", icon: "calendar.circle.fill", data: "$10"),
    ListItem(name: "Annually", icon: "calendar.circle", data: "$60"),
    ListItem(name: "Lifetime", icon: "calendar.circle.fill", data: "$100")
]

struct ListItem: Hashable {
    let name: String
    let icon: String?
    let data: String?
}

struct TestScrollView: View {
    var body: some View {
        // Parameters
        let itemList: [ListItem] = optionList
        let buttonType: ButtonType = .micro
        let layout: TextLayout = .centerText
        let buttonHeight: ButtonHeight = .short
        
        // ScrollView
        ScrollView {
            VStack(spacing: 0) {
                ForEach(itemList, id: \.self) { item in
                    CustomButton(title: item.name, data: item.data, icon: item.icon, buttonType: buttonType, layout: layout, height: buttonHeight, isSelected: false, action: testAction)
                }
            }
        }
        .frame(width: .infinity, height: .infinity)
    }
}

#Preview {
    TestScrollView()
}
