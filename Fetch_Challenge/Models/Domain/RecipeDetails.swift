//
//  RecipeDetails.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/4/24.
//

import Foundation

struct RecipeDetails {
    let id: String
    let name: String
    let instructions: String
    let category: RecipeCategory
    let ingredients: [Ingredient]
}
