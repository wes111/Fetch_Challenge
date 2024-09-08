//
//  RecipesListViewModel.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/4/24.
//

import Factory
import Foundation

@Observable @MainActor
final class RecipesListViewModel {
    @ObservationIgnored @Injected(\.recipeService) private var recipeService
    var state: ViewModelState<[Recipe]> = .idle
}

// MARK: - Methods
extension RecipesListViewModel {
    
    func fetchDesserts() async {
        do {
            state = .loading
            let recipes = try await recipeService.fetchDessertRecipes()
            state = .success(data: recipes)
        } catch {
            state = .failed(error: error)
            print(error)
        }
    }
}
