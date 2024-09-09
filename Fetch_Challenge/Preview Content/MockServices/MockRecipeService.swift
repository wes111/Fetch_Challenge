//
//  MockRecipeService.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/7/24.
//

import Foundation

final class MockRecipeService: RecipeService {
    func fetchDessertRecipes() async throws -> [Recipe] {
        Recipe.previewArray
    }
    
    func fetchRecipeDetails(recipeId: String) async throws -> RecipeDetails {
        RecipeDetails.preview
    }
}
