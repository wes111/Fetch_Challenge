//
//  RecipeSection.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/7/24.
//

import SwiftUI

struct RecipeSection: ViewModifier {
    let title: String
    
    func body(content: Content) -> some View {
        VStack(alignment: .leading) {
            Divider()
                .frame(height: 2)
                .overlay(Color.black)
            
            Group {
                Text(title)
                    .font(.title)
                    .padding(.bottom)
                
                content
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - View Extension
extension View {
    func recipeSection(title: String) -> some View {
        self.modifier(RecipeSection(title: title))
    }
}

// MARK: - Preview
#Preview {
    Text("Recipe Preview")
        .recipeSection(title: "Preview Title")
}
