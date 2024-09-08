//
//  Ingredient.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/5/24.
//

import Foundation

struct Ingredient: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let measurement: String?
}
