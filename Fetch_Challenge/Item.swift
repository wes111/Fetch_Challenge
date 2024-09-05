//
//  Item.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/4/24.
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
