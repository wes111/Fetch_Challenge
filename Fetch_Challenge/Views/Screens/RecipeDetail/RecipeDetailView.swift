//
//  RecipeDetailView.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/4/24.
//

import Factory
import SwiftUI

@MainActor
struct RecipeDetailView: View {
    @State
    private var viewModel: RecipeDetailViewModel
    
    init(recipe: Recipe) {
        self.viewModel = .init(recipe: recipe)
    }
    
    var body: some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(viewModel.title)
            .task {
                await viewModel.fetchDetails()
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
private extension RecipeDetailView {
    
    var content: some View {
        VStack {
            switch viewModel.state {
            case .idle, .refreshing, .failed:
                EmptyView()  // TODO: Create views as necessary for these states.
                
            case .loading:
                ProgressView()
                    .controlSize(.large)
                
            case .success(let recipeDetails):
                recipeDetailsView(recipeDetails)
            }
        }
    }
    
    func recipeDetailsView(_ details: RecipeDetails) -> some View {
        ScrollView {
            VStack {
                Text(details.instructions)
                    .recipeSection(title: "Instructions")
                
                ForEach(details.ingredients) { ingredient in
                    ingredientView(ingredient)
                }
                .recipeSection(title: "Ingredients")
            }
            .multilineTextAlignment(.leading)
        }
        .scrollBounceBehavior(.basedOnSize, axes: [.vertical])
    }
    
    func ingredientView(_ ingredient: Ingredient) -> some View {
        VStack(alignment: .leading) {
            Text(ingredient.name)
                .font(.body)
            Text(ingredient.measurement ?? "")
                .font(.caption)
                .fontWeight(.light)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 3)
    }
}

// MARK: - Preview
#Preview {
    let _ = Container.shared.recipeService.register { MockRecipeService() }
    
    return NavigationStack {
        RecipeDetailView(recipe: .preview)
    }
}
