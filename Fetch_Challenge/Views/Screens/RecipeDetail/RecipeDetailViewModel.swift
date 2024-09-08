//
//  RecipeDetailViewModel.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/4/24.
//

import Factory
import Foundation

@Observable @MainActor
final class RecipeDetailViewModel {
    @ObservationIgnored @Injected(\.recipeService) private var recipeService
    var recipeDetails: RecipeDetails?
    private let recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
}

// MARK: - Computed Properties
extension RecipeDetailViewModel {
    var title: String {
        recipe.name
    }
}

// MARK: - Methods
extension RecipeDetailViewModel {
    func fetchDetails() async {
        do {
            recipeDetails = try await recipeService.fetchRecipeDetails(for: recipe.id)
        } catch {
            print(error)
        }
    }
}
