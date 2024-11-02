//
//  Item.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/2/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
