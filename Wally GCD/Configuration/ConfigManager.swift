//
//  ConfigManager.swift
//  Wally GCD
//
//  Created by Shreyansh Raj  Keshri on 02/11/23.
//

import Foundation

public struct ConfigManager {
    enum Keys {
        static let apiKey = "API_KEY"
        static let baseURL = "BASE_URL"
        static let version = "VERSION"
    }
    
    // Get the API_KEY
    static let apiKey: String = {
        guard let property = Bundle.main.object(forInfoDictionaryKey: Keys.apiKey) as? String else {
            fatalError("API_KEY not found")
        }
        
        return property
    }()
    
    // Get the BASE_URL
    static let baseURL: String = {
        guard let property = Bundle.main.object(forInfoDictionaryKey: Keys.baseURL) as? String else {
            fatalError("BASE_KEY not found")
        }
        
        return property
    }()
    
    
    static let version: String = {
        guard let property = Bundle.main.object(forInfoDictionaryKey: Keys.version) as? String else {
            fatalError("VERSION not found")
        }
        
        return property
    }()
}
