//
//  Tag.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/5/24.
//

import SwiftUI

struct Tag: Identifiable {
    let id: UUID = .init()
    
    var name: String
    var color: Color
    var fontColor: Color
}

struct SampleTags {
    
    let userTags: [Tag] = [
        .init(name: "Fertile", color: .red, fontColor: .white),
        .init(name: "Cull", color: .blue, fontColor: .white),
        .init(name: "Nursing", color: .green, fontColor: .white),
        .init(name: "Move", color: .yellow, fontColor: .white)
    ]
    
    let systemTags: [Tag] = [
        .init(name: "Pregnant", color: .red, fontColor: .white),
        .init(name: "Inseminated", color: .blue, fontColor: .white),
        .init(name: "Recipiant", color: .green, fontColor: .white)
    ]
}
