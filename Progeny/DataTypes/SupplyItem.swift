//
//  SupplyItemClass.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/25/24.
//


//
//  SupplyItem.swift
//  Progeny
//
//  Created by [Your Name] on [Date].
//

import Foundation

class SupplyItemClass: ObservableObject {
    @Published var supplyItemList: [SupplyItem] = [
        Semen(
            name: "Angus Bull Semen",
            sire: "Top Bull",
            count: 20,
            isAvailable: true
        ),
        Embryo(
            name: "High Quality Embryo",
            sire: "Top Bull",
            dam: "Elite Cow",
            count: 5,
            isAvailable: true
        )
    ]
}

// Base class or protocol for SupplyItem
class SupplyItem: ObservableObject, Identifiable, Hashable {
    // Identity
    let id: UUID
    @Published var name: String
    @Published var count: Int
    @Published var isAvailable: Bool

    init(
        id: UUID = UUID(),
        name: String,
        count: Int,
        isAvailable: Bool
    ) {
        self.id = id
        self.name = name
        self.count = count
        self.isAvailable = isAvailable
    }

    // Conformance to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: SupplyItem, rhs: SupplyItem) -> Bool {
        lhs.id == rhs.id
    }
}

// Subclass for Semen
class Semen: SupplyItem {
    @Published var sire: String

    init(
        id: UUID = UUID(),
        name: String,
        sire: String,
        count: Int,
        isAvailable: Bool
    ) {
        self.sire = sire
        super.init(id: id, name: name, count: count, isAvailable: isAvailable)
    }
}

// Subclass for Embryo
class Embryo: SupplyItem {
    @Published var sire: String
    @Published var dam: String

    init(
        id: UUID = UUID(),
        name: String,
        sire: String,
        dam: String,
        count: Int,
        isAvailable: Bool
    ) {
        self.sire = sire
        self.dam = dam
        super.init(id: id, name: name, count: count, isAvailable: isAvailable)
    }
}
