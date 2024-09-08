//
//  Recipe.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/4/24.
//

import Foundation

struct Recipe: Identifiable, Equatable {
    let id: String
    let name: String
    let thumbnailUrl: URL?
}
