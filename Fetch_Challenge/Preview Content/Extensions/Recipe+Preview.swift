//
//  Recipe+Preview.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/7/24.
//

import Foundation

extension Recipe {
    static let preview: Recipe = {
        let recipesDTO = try! JSONLoader.shared.loadJSON(filename: "Recipes", as: [RecipeDTO].self)
        return recipesDTO.map { $0.toRecipe() }.first!
    }()
    
    static let previewArray: [Recipe] = {
        let recipesDTO = try! JSONLoader.shared.loadJSON(filename: "Recipes", as: [RecipeDTO].self)
        return recipesDTO.map { $0.toRecipe() }
    }()
}
