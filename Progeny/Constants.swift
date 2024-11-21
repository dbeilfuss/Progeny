//
//  Constants.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/9/24.
//

import Foundation

struct Constants {
    var animalIcon: String = "CowIcon"
    
    var terms = Terms(
        animalNameSingular: "Cow",
        animalNamePlural: "Cows",
        animalBabyName: "Calf",
        animalBabyNamePlural: "Calfs",
        animalGroup: "Herd"
    )
}

struct Terms {
    var animalNameSingular: String
    var animalNamePlural: String
    var animalBabyName: String
    var animalBabyNamePlural: String
    var animalGroup: String
}
