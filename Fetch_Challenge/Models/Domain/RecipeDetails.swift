//
//  RecipeDetails.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/4/24.
//

import Foundation

struct RecipeDetails: Equatable {
    let id: String
    let instructions: String
    let category: RecipeCategory
    let ingredients: [Ingredient]
}
