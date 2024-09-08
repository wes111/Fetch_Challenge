//
//  MealsListDTO.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/5/24.
//

import Foundation

struct MealsListDTO<Item: Decodable>: Decodable {
    let items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case items = "meals"
    }
}
