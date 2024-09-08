//
//  RecipeDetailView.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/4/24.
//

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
                    Text("\(ingredient.measurement ?? "") \(ingredient.name)")
                }
                .recipeSection(title: "Ingredients")
            }
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .scrollBounceBehavior(.basedOnSize, axes: [.vertical])
    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        RecipeDetailView(recipe: .init(id: "53049", name: "", thumbnailUrl: nil))
    }
}
