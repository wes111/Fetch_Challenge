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
}

final class RecipeServiceDefault: RecipeService {
    @Injected(\.networkManager) private var networkManager
    
    func fetchDessertRecipes() async throws -> [Recipe] {
        let mealsDTO: MealsListDTO = try await networkManager.fetch(.meals(category: .dessert))
        return mealsDTO.items.map { $0.toRecipe() }
    }
}
