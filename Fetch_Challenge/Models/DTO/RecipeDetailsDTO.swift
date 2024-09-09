//
//  RecipeDetailsDTO.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/5/24.
//

import Foundation

struct RecipeDetailsDTO: Decodable {
    let id: String
    let name: String
    let category: RecipeCategory
    let instructions: String
    let thumbnailUrl: URL?
    let ingredients: [IngredientDTO]
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case category = "strCategory"
        case instructions = "strInstructions"
        case thumbnailUrl = "strMealThumb"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.category = try container.decode(RecipeCategory.self, forKey: .category)
        self.instructions = try container.decode(String.self, forKey: .instructions)
        self.thumbnailUrl = try? container.decode(URL.self, forKey: .thumbnailUrl)
        self.ingredients = try Self.decodeIngredients(from: decoder)
    }
    
    private static func decodeIngredients(from decoder: Decoder) throws -> [IngredientDTO] {
        var ingredients: [IngredientDTO] = []
        
        let container = try decoder.container(keyedBy: AnyStringKey.self)
        var index = 1
        
        while
            let ingredientName = try container.decodeIfPresent(String.self, forKey: AnyStringKey(stringValue: "strIngredient\(index)")),
            !ingredientName.isEmpty
        {
            let measurement = try container.decodeIfPresent(String.self, forKey: AnyStringKey("strMeasure\(index)"))
            ingredients.append(IngredientDTO(name: ingredientName, measurement: measurement))
            index += 1
        }
        
        return ingredients
    }
    
    func toRecipeDetails() -> RecipeDetails {
        .init(
            id: id,
            instructions: instructions,
            category: category,
            ingredients: ingredients.map { $0.toIngredient() }
        )
    }
}
