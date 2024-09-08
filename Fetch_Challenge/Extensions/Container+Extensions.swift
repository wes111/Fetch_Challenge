//
//  Container+Extensions.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/4/24.
//

import Foundation
import Factory

extension Container {
    
    var networkService: Factory<NetworkService> {
        self { NetworkServiceDefault() }.scope(.shared)
    }
    
    var recipeService: Factory<RecipeService> {
        self { RecipeServiceDefault() }.scope(.shared)
    }
}
