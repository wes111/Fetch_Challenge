//
//  RecipeDetails+Preview.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/7/24.
//

import Foundation

extension RecipeDetails {
    static let preview: RecipeDetails = {
        let recipeDetailsDTO = try! JSONLoader.shared.loadJSON(filename: "RecipeDetails", as: RecipeDetailsDTO.self)
        return recipeDetailsDTO.toRecipeDetails()
    }()
}

