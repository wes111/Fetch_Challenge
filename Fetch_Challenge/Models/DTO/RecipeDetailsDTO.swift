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
        
        case ingredientOne = "strIngredient1"
        case ingredientTwo = "strIngredient2"
        case ingredientThree = "strIngredient3"
        case ingredientFour = "strIngredient4"
        case ingredientFive = "strIngredient5"
        case ingredientSix = "strIngredient6"
        case ingredientSeven = "strIngredient7"
        case ingredientEight = "strIngredient8"
        case ingredientNine = "strIngredient9"
        case ingredientTen = "strIngredient10"
        case ingredientEleven = "strIngredient11"
        case ingredientTwelve = "strIngredient12"
        case ingredientThirteen = "strIngredient13"
        case ingredientFourteen = "strIngredient14"
        case ingredientFifteen = "strIngredient15"
        case ingredientSixteen = "strIngredient16"
        case ingredientSeventeen = "strIngredient17"
        case ingredientEighteen = "strIngredient18"
        case ingredientNineteen = "strIngredient19"
        case ingredientTwenty = "strIngredient20"
        
        case measurementOne = "strMeasure1"
        case measurementTwo = "strMeasure2"
        case measurementThree = "strMeasure3"
        case measurementFour = "strMeasure4"
        case measurementFive = "strMeasure5"
        case measurementSix = "strMeasure6"
        case measurementSeven = "strMeasure7"
        case measurementEight = "strMeasure8"
        case measurementNine = "strMeasure9"
        case measurementTen = "strMeasure10"
        case measurementEleven = "strMeasure11"
        case measurementTwelve = "strMeasure12"
        case measurementThirteen = "strMeasure13"
        case measurementFourteen = "strMeasure14"
        case measurementFifteen = "strMeasure15"
        case measurementSixteen = "strMeasure16"
        case measurementSeventeen = "strMeasure17"
        case measurementEighteen = "strMeasure18"
        case measurementNineteen = "strMeasure19"
        case measurementTwenty = "strMeasure20"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.category = try container.decode(RecipeCategory.self, forKey: .category)
        self.instructions = try container.decode(String.self, forKey: .instructions)
        self.thumbnailUrl = try? container.decode(URL.self, forKey: .thumbnailUrl)
        
        let ingredientKeys: [CodingKeys] = [
            .ingredientOne, .ingredientTwo, .ingredientThree, .ingredientFour, .ingredientFive,
            .ingredientSix, .ingredientSeven, .ingredientEight, .ingredientNine, .ingredientTen,
            .ingredientEleven, .ingredientTwelve, .ingredientThirteen, .ingredientFourteen, .ingredientFifteen,
            .ingredientSixteen, .ingredientSeventeen, .ingredientEighteen, .ingredientNineteen, .ingredientTwenty
        ]
        
        let measurementKeys: [CodingKeys] = [
            .measurementOne, .measurementTwo, .measurementThree, .measurementFour, .measurementFive,
            .measurementSix, .measurementSeven, .measurementEight, .measurementNine, .measurementTen,
            .measurementEleven, .measurementTwelve, .measurementThirteen, .measurementFourteen, .measurementFifteen,
            .measurementSixteen, .measurementSeventeen, .measurementEighteen, .measurementNineteen, .measurementTwenty
        ]
        
        var ingredients: [IngredientDTO] = []
        
        for (ingredientKey, measurementKey) in zip(ingredientKeys, measurementKeys) {
            if let ingredientName = try? container.decodeIfPresent(String.self, forKey: ingredientKey),
               !ingredientName.isEmpty {
                let measurement = try? container.decodeIfPresent(String.self, forKey: measurementKey)
                ingredients.append(IngredientDTO(name: ingredientName, measurement: measurement))
            }
        }
        
        self.ingredients = ingredients
    }
    
    func toRecipeDetails() -> RecipeDetails {
        .init(
            id: id,
            name: name,
            instructions: instructions,
            category: category,
            ingredients: ingredients.map { $0.toIngredient() }
        )
    }
}
