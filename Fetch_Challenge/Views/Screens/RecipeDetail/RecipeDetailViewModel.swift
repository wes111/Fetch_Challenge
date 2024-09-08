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
    @ObservationIgnored
    @Injected(\.recipeService)
    private var recipeService
    
    var state: ViewModelState<RecipeDetails> = .idle
    var showAlert: Bool = false
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
            state = .loading
            guard let details = try await recipeService.fetchRecipeDetails(recipeId: recipe.id) else {
                state = .failed(error: TheMealDBError.missingDetails)
                return
            }
            state = .success(data: details)
        } catch {
            state = .failed(error: error)
            print(error)
        }
    }
}
