//
//  ListViewParameters.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/2/24.
//

import SwiftUI

struct Fillers {
    @State var stringFiller: String = ""
}

enum ListType {
    case animals
    case locations
    case supplies
    
    var parameters: ButtonParameters {
        switch self {
        case .animals:
            return ButtonParameters (
                title: "N/A",
                buttonType: .primary,
                layout: .textRightAlligned,
                height: .tall,
                isSelected: false,
                requiresSubscription: false,
                activeSubscription: true
                )
        case .locations:
            return ButtonParameters (
                title: "N/A",
                buttonType: .primary,
                layout: .textRightAlligned,
                height: .tall,
                isSelected: false,
                requiresSubscription: false,
                activeSubscription: true
                )
        case .supplies:
            return ButtonParameters (
                title: "N/A",
                buttonType: .cell,
                layout: .textLeftAlligned,
                height: .tall,
                isSelected: false,
                requiresSubscription: false,
                activeSubscription: true
                )
        }
    }
}

struct ListItem {
    let name: String
    let icon: String?
    let data: String?
}


//MARK: - Helper Functions
//func convertToButtonList(for originalList: [Fetchable]) -> [ListItem] {
//    let k = Constants()
//    var buttonList: [ListItem] = []
//    
//    for item in originalList {
//        switch item {
//        case let listItem as ListItem:
//            buttonList.append(listItem)
//        case let animal as Animal:
//            let id: UUID = animal.id
//            var name: String = ""
//            
//            switch animal.name {
//            case nil:
//                name = animal.visibleID ?? ""
//            default :
//                name = (animal.name! + (animal.visibleID == "" ? "" : (animal.visibleID != nil ? (": " + (animal.visibleID!)) : "")))
//            }
//            
//            let listItem = ListItem(id: id, name: name, icon: k.animalIcon, data: "")
//            buttonList.append(listItem)
//        default:
//            print("unable to determin list item type: \(#function)")
//            break
//        }
//    }
//    
//    return buttonList
//}

struct DestinationView: View {
    let item: ListItem
    
    var body: some View {
        Text("Welcome to \(item.name)!")
    }
}

#Preview {
    @Previewable @State var selectedItem: ListItem?
    AnimalListView(navigationTitle: "List Scroll View", listType: .animals)
}

//MARK: - Initial Testing Data

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

let locationList: [ListItem] = [
    ListItem(name: "Davie Place", icon: "mappin.and.ellipse", data: "56 hd"),
    ListItem(name: "High Tower", icon: "location.north.line", data: "1 hd"),
    ListItem(name: "Homestead", icon: "location", data: "108 hd"),
    ListItem(name: "Wallace County", icon: "location.app.fill", data: "12 hd"),
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
