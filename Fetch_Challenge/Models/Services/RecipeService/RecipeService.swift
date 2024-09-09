//
//  RecipeService.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/5/24.
//

import Factory
import Foundation

protocol RecipeService {
    func fetchDessertRecipes() async throws -> [Recipe]
    func fetchRecipeDetails(recipeId: String) async throws -> RecipeDetails
}

final class RecipeServiceDefault: RecipeService {
    @Injected(\.networkService) private var networkService
    
    func fetchDessertRecipes() async throws -> [Recipe] {
        let mealsDTO: MealsListDTO<RecipeDTO> = try await networkService.fetch(.meals(category: .dessert))
        return mealsDTO.items.map { $0.toRecipe() }.filter { !$0.name.isEmpty && !$0.id.isEmpty }
    }
    
    func fetchRecipeDetails(recipeId: String) async throws -> RecipeDetails {
        let mealsDTO: MealsListDTO<RecipeDetailsDTO> = try await networkService.fetch(.recipeDetails(id: recipeId))
        
        let recipeDetails = mealsDTO.items
            .filter { !$0.id.isEmpty && !$0.ingredients.isEmpty && !$0.instructions.isEmpty }
            .first?.toRecipeDetails()
        
        guard let recipeDetails else {
            throw RecipeServiceError.missingRecipeDetails
        }
        
        return recipeDetails
    }
}
