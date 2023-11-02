//
//  JSONParser.swift
//  Wally GCD
//
//  Created by Shreyansh Raj  Keshri on 01/11/23.
//

import Foundation


public class JSONParser {
    private let decoder = JSONDecoder()
    
    func decode<T: Codable>(_ data: Data) -> T? {
        return try? decoder.decode(T.self, from: data)
    }
}
