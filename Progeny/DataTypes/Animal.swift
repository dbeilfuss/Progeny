//
//  Animal.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/8/24.
//

import Foundation

class AnimalClass {
    
    @Published var testAnimalList: [Animal] = [
        Animal(visibleID: "0085", sex: .female, status: .active),
        Animal(visibleID: "0104", sex: .female, status: .active),
        Animal(name: "Kojak", sex: .male, status: .active)
    ]
    
}

enum Sex: String, CaseIterable {
    case male = "Male"
    case female = "Female"
    case unknown = "Unknown"
}

enum LineageOption {
    case natural(sireID: String, damID: String, likelyPercentage: Double?)
    case cleanup(sireID: String, damID: String, likelyPercentage: Double?)
    case insemination(sireID: String, damID: String, likelyPercentage: Double?)
    case invitro(embryoID: String, surrogateDamID: String, likelyPercentage: Double?)
}

struct Milestone {
    var name: String
    var date: Date
}

enum BreedingEvent {
    case insemination(semenID: String, femaleID: String, date: Date)
    case embryoTransfer(embryoID: String, femaleID: String, date: Date)
    case natural(maleID: String, femaleID: String, date: Date)
    case cleanup(maleID: String, femaleID: String, date: Date)
    case confirmation(confirmationDate: Date, dueDate: Date)
    case birthing(calfID: String, date: Date)
}


struct Animal: Pinnable, Taggable, Fetchable, Hashable {
    
    // Identity
    var id: UUID = .init()
    var visibleID: String?
    var name: String?
    var breed: String?
    var sex: Sex
    var dueDate: Date? //For use on computing likely lineage
    var birthDate: Date?
    var purchaseDate: Date?
    var status: Status
    var milestones: [Milestone] = []
    
    // Lineage
    var sireID: String?
    var damID: String?
    var surrogateDamID: String?
    var lineageOptions: [LineageOption] = []
    
    // UserData
    var isPinned: Bool = false // Need to make a computed property
    var tags: [String] = []
    
    func listItem() -> ListItem {
        let listItem = ListItem(
            name: name ?? "",
            icon: "CowIcon",
            data: visibleID ?? "")
        
        return listItem
    }
    
    // Conformance to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id) // Use `id` as the unique identifier for hashing
    }
    
    static func == (lhs: Animal, rhs: Animal) -> Bool {
        lhs.id == rhs.id // Equality is based on the unique `id`
    }
    
}


