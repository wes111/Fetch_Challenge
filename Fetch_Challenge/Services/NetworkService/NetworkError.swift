//
//  NetworkError.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/7/24.
//

import Foundation

enum NetworkError: Error {
    case invalidRequestURL
    case invalidResponse
    case invalidStatusCode(Int)
    case unknownError
}

enum TheMealDBError: Error {
    case missingDetails
}
