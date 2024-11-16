//
//  Protocols.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/8/24.
//

import Foundation

protocol Fetchable {
    var id: UUID { get }
}

enum FetchableType {
    case animal
    case all
    
//    func lookup(by id: String) -> Fetchable? {
//        var searchList: [Fetchable] = []
//        
//        switch self {
//        case .animal:
//            searchList = AnimalClass().testAnimalList
//        case .all:
//            searchList = AnimalClass().testAnimalList
//        }
//        let filteredList = searchList.filter { $0.id.uuidString == id }
//
//        return filteredList.first
//    }
}

protocol Taggable {
    var id: UUID { get }
    var tags: [String] { get set }
}

protocol Pinnable {
    var id: UUID { get }
    var isPinned: Bool { get set }
}

var testList: [String] = [""]

struct testAnimal: Fetchable, Taggable, Pinnable {
    let id: UUID = UUID()
    var tags: [String] = []
    var isPinned: Bool {
        get {
            if testList.contains(id.uuidString) {
                return true
            } else {
                return false
            }
        }
        set {
            if newValue == true {
                testList.append(id.uuidString)
            } else {
                testList.remove(at: testList.firstIndex(of: id.uuidString)!)
            }
        }
    }
}


