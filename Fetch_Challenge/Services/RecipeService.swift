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
    func fetchRecipeDetails(recipeId: String) async throws -> RecipeDetails?
}

final class RecipeServiceDefault: RecipeService {
    @Injected(\.networkService) private var networkService
    
    func fetchDessertRecipes() async throws -> [Recipe] {
        let mealsDTO: MealsListDTO<RecipeDTO> = try await networkService.fetch(.meals(category: .dessert))
        try await Task.sleep(nanoseconds: 2_000_000_000)
        return mealsDTO.items.map { $0.toRecipe() }
    }
    
    func fetchRecipeDetails(recipeId: String) async throws -> RecipeDetails? {
        let mealsDTO: MealsListDTO<RecipeDetailsDTO> = try await networkService.fetch(.recipeDetails(id: recipeId))
        try await Task.sleep(nanoseconds: 2_000_000_000)
        return mealsDTO.items.first?.toRecipeDetails()
    }
}
