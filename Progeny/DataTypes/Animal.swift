//
//  Animal.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/8/24.
//

import Foundation

class AnimalClass: ObservableObject {
    
    @Published var testAnimalList: [Animal] = [
        Animal(name: "Kojak", sex: .male, status: .active),
        Animal(visibleID: "0085", sex: .female, status: .active),
        Animal(visibleID: "0104", sex: .female, status: .active)
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

class Animal: ObservableObject, Identifiable, Hashable {
    
    // Identity
    let id: UUID
    @Published var visibleID: String?
    @Published var name: String?
    @Published var breed: String?
    @Published var sex: Sex
    @Published var dueDate: Date?
    @Published var birthDate: Date?
    @Published var purchaseDate: Date?
    @Published var status: Status
    @Published var milestones: [Milestone]
    
    // Lineage
    @Published var sireID: String?
    @Published var damID: String?
    @Published var surrogateDamID: String?
    @Published var lineageOptions: [LineageOption]
    
    // UserData
    @Published var isPinned: Bool
    @Published var tags: [String]
    
    init(
        id: UUID = UUID(),
        visibleID: String? = nil,
        name: String? = nil,
        breed: String? = nil,
        sex: Sex,
        dueDate: Date? = nil,
        birthDate: Date? = nil,
        purchaseDate: Date? = nil,
        status: Status,
        milestones: [Milestone] = [],
        sireID: String? = nil,
        damID: String? = nil,
        surrogateDamID: String? = nil,
        lineageOptions: [LineageOption] = [],
        isPinned: Bool = false,
        tags: [String] = []
    ) {
        self.id = id
        self.visibleID = visibleID
        self.name = name
        self.breed = breed
        self.sex = sex
        self.dueDate = dueDate
        self.birthDate = birthDate
        self.purchaseDate = purchaseDate
        self.status = status
        self.milestones = milestones
        self.sireID = sireID
        self.damID = damID
        self.surrogateDamID = surrogateDamID
        self.lineageOptions = lineageOptions
        self.isPinned = isPinned
        self.tags = tags
    }
    
    // Conformance to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Animal, rhs: Animal) -> Bool {
        lhs.id == rhs.id
    }
}


