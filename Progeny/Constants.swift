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
        animalGroup: "Herd"
    )
}

struct Terms {
    var animalNameSingular: String
    var animalNamePlural: String
    var animalGroup: String
}
