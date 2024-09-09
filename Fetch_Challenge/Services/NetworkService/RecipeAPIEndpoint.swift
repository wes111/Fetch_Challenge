//
//  RecipeAPIEndpoint.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/4/24.
//

import Foundation

enum RecipeAPIEndpoint {
    case meals(category: RecipeCategory)
    case recipeDetails(id: String)
    
    private static let baseURL = "https://themealdb.com"
    private static let apiBasePath = "/api/json/v1/1"
    
    private struct Paths {
        static let meals = "/filter.php"
        static let recipeDetails = "/lookup.php"
    }
    
    private struct QueryKeys {
        static let category = "c"
        static let id = "i"
    }
    
    var url: URL? {
        var components = URLComponents(string: Self.baseURL)
        components?.path = Self.apiBasePath
        
        switch self {
        case .meals(let category):
            components?.path += Paths.meals
            components?.queryItems = [URLQueryItem(name: QueryKeys.category, value: category.rawValue)]
            
        case .recipeDetails(let id):
            components?.path += Paths.recipeDetails
            components?.queryItems = [URLQueryItem(name: QueryKeys.id, value: id)]
        }
        
        return components?.url
    }
}
