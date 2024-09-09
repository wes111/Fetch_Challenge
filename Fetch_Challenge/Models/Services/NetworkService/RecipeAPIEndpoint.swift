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
    
    private var path: String {
        switch self {
        case .meals:
            "/api/json/v1/1/filter.php"
            
        case .recipeDetails:
            "/api/json/v1/1/lookup.php"
        }
    }
    
    private struct QueryKeys {
        static let category = "c"
        static let id = "i"
    }
    
    private var scheme: String {
        return "https"
    }
    
    private var host: String {
        return "www.themealdb.com"
    }
    
    private var queryItems: [URLQueryItem] {
        switch self {
        case .meals(let category):
            return [URLQueryItem(name: QueryKeys.category, value: category.rawValue)]
            
        case .recipeDetails(let id):
            return [URLQueryItem(name: QueryKeys.id, value: String(id))]
        }
    }
    
    var url: URL? {
        var urlComponent = URLComponents()
        urlComponent.host = host
        urlComponent.scheme = scheme
        urlComponent.path = path
        urlComponent.queryItems = queryItems
        return urlComponent.url
    }
}
