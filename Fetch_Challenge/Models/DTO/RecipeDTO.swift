//
//  RecipeDTO.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/5/24.
//

import Foundation

struct RecipeDTO: Codable {
    let id: String
    let name: String
    let thumbnailUrl: URL?
    
    func toRecipe() -> Recipe {
        .init(id: id, name: name, thumbnailUrl: thumbnailUrl)
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnailUrl = "strMealThumb"
    }
}
