//
//  Constants.swift
//  Wally GCD
//
//  Created by Shreyansh Raj  Keshri on 01/11/23.
//

import Foundation


struct Constants {
    //Home Landing
    struct HomeLanding {
        static let Title = "Wally"
        static let WallyTableViewCell = "WallyTableViewCell"
        static let WallyCollectionViewCell = "WallyCollectionViewCell"
        static let CustomHeaderTableViewCell = "CustomHeaderTableViewCell"
    }
    
    //Network Layer
    struct NetworkLayer {
        static let apiKey = ConfigManager.apiKey
        static let baseURL = ConfigManager.baseURL
        static let version = ConfigManager.version
    }
}
