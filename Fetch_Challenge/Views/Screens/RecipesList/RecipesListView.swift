//
//  ContentView.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/4/24.
//

import Factory
import SwiftUI
import SwiftData

@MainActor
struct RecipesListView: View {
    @State
    private var viewModel = RecipesListViewModel()
    
    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Fetch Desserts")
        }
        .task {
            await viewModel.fetchDesserts()
        }
        .onChange(of: viewModel.state) { _, newValue in
            if case .failed = newValue {
                viewModel.showAlert = true
            }
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert.genericAlert
        }
    }
}

// MARK: - Subviews
private extension RecipesListView {
    
    @ViewBuilder
    var content: some View {
        switch viewModel.state {
        case .idle, .refreshing, .failed:
            EmptyView() // TODO: Create views as necessary for these states.
            
        case .loading:
            ProgressView()
                .controlSize(.large)
            
        case .success(let recipes):
            recipeList(recipes)
        }
    }
    
    func recipeList(_ recipes: [Recipe]) -> some View {
        List {
            ForEach(recipes) { recipe in
                NavigationLink {
                    RecipeDetailView(recipe: recipe)
                } label: {
                    recipeCard(for: recipe)
                }
            }
        }
    }
    
    func recipeCard(for recipe: Recipe) -> some View {
        Text(recipe.name)
    }
}

// MARK: - Preview
#Preview {
    let _ = Container.shared.recipeService.register { MockRecipeService() }
    return RecipesListView()
}
