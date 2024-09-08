//
//  NetworkManager.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/4/24.
//

import Foundation

enum NetworkError: Error {
    case invalidRequestURL
    case invalidResponse
    case invalidStatusCode(Int)
    case unknownError
}

protocol NetworkService {
    func fetch<T: Codable>(_ request: Request) async throws -> T
}

final class NetworkServiceDefault: NetworkService {
    
    func fetch<T: Codable>(_ request: Request) async throws -> T {
        guard let url = request.url else {
            throw NetworkError.invalidRequestURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidStatusCode(httpResponse.statusCode)
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
