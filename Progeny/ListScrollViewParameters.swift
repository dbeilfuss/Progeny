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
    case supplyItems
    case hyperlinks
    
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
        case .supplyItems:
            return ButtonParameters (
                title: "N/A",
                buttonType: .cell,
                layout: .textRightAlligned,
                height: .tall,
                isSelected: false,
                requiresSubscription: false,
                activeSubscription: true
                )
        case .hyperlinks:
            return ButtonParameters (
                title: "N/A",
                buttonType: .hyperlink,
                layout: .textLeftAlligned,
                height: .short,
                isSelected: false,
                requiresSubscription: true,
                activeSubscription: true
                )
        }
    }
}

struct ListItem {
    let name: String
    let icon: String?
    let data: String?
    
    // Initializer for Animal
    init(from animal: Animal) {
        var name: String {
            if animal.name != nil {
                animal.name!
            } else {
                animal.visibleID
            }
        }
        
        self.name = name
        self.icon = Constants().animalIcon
        self.data = animal.visibleID
    }
    
    // Initializer for Location
    init(from location: Location) {
        self.name = location.name
        self.icon = "mappin.and.ellipse" // Placeholder icon for a location
        self.data = location.address ?? "No address provided"
    }
    
    // Initializer for SupplyItem
    init(from supplyItem: SupplyItem) {
        self.name = supplyItem.name
        self.icon = "tag" // Default icon for supply items, can be customized per type
        
        if let semen = supplyItem as? Semen {
            self.data = "Sire: \(semen.sire), Count: \(semen.count)"
        } else if let embryo = supplyItem as? Embryo {
            self.data = "Sire: \(embryo.sire), Dam: \(embryo.dam), Count: \(embryo.count)"
        } else {
            self.data = "Count: \(supplyItem.count)"
        }
    }
    
    init(name: String, icon: String?, data: String?) {
        self.name = name
        self.icon = icon
        self.data = data
    }
}

struct DestinationView: View {
    let item: ListItem
    
    var body: some View {
        Text("Welcome to \(item.name)!")
    }
}

// MARK: - Previews
#Preview {
    SupplyItemListView(navigationTitle: "Supply Items", listType: .supplyItems)
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
