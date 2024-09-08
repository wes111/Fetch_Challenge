//
//  JSONLoader.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/7/24.
//

import Foundation

final class JSONLoader {
    static let shared = JSONLoader()
    private let decoder = JSONDecoder()
    
    private init() {}
    
    func loadJSON<T: Decodable>(filename: String, as type: T.Type) throws -> T {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            fatalError("Failed to locate \(filename).json in bundle.")
        }
        
        let data = try Data(contentsOf: url)
        return try decoder.decode(T.self, from: data)
    }
}
