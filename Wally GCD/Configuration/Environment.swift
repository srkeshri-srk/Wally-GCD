//
//  Environment.swift
//  Wally GCD
//
//  Created by Shreyansh Raj  Keshri on 02/11/23.
//

import Foundation

public struct Environment {
    enum Keys {
        static let apiKey = "API_KEY"
    }
    
    // Get the API_KEY
    static let apiKey: String = {
        guard let baseURLProperty = Bundle.main.object(forInfoDictionaryKey: Keys.apiKey) as? String else {
            fatalError("API_KEY not found")
        }
        
        return baseURLProperty
    }()
}
