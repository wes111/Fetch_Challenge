//
//  AnyStringKey.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/8/24.
//

import Foundation

// Modified from https://stackoverflow.com/questions/70644235/encode-dictionary-without-adding-the-coding-key-enum-in-swift
struct AnyStringKey: CodingKey, Hashable, ExpressibleByStringLiteral {
    var stringValue: String
    var intValue: Int?
    
    init(stringValue: String) {
        self.stringValue = stringValue
    }
    
    init(_ stringValue: String) {
        self.init(stringValue: stringValue)
    }
    
    init?(intValue: Int) {
        return nil
    }
    
    init(stringLiteral value: String) {
        self.init(value)
    }
}
