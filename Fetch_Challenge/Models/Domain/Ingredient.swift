//
//  Ingredient.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/5/24.
//

import Foundation

// TODO: Ingredients and measurements can be duplicated, need to come up with id...
struct Ingredient: Identifiable, Equatable {
    let name: String
    let measurement: String?
    
    var id: String {
        name
    }
}
