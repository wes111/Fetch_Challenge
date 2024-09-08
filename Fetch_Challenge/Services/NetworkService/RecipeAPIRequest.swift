//
//  Request.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/4/24.
//

import Foundation

enum RecipeAPIRequest {
    case meals(category: RecipeCategory)
    case recipeDetails(id: String)
    
    var url: URL? {
        switch self {
        case .meals(let category):
                .init(string: "https://themealdb.com/api/json/v1/1/filter.php?c=\(category.rawValue)")
            
        case .recipeDetails(let id):
                .init(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)")
        }
    }
}
