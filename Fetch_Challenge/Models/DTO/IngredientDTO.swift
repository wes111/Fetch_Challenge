//
//  IngredientDTO.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/5/24.
//

import Foundation

struct IngredientDTO: Codable {
    let name: String
    let measurement: String?
    
    func toIngredient() -> Ingredient {
        .init(name: name, measurement: measurement)
    }
}
