//
//  JSONParser.swift
//  Wally GCD
//
//  Created by Shreyansh Raj  Keshri on 01/11/23.
//

import Foundation

public class JSONParser {
    private let jsonDecoder = JSONDecoder()
    
    func decode<T: Codable>(_ data: Data) -> T? {
        return try? jsonDecoder.decode(T.self, from: data)
    }
}
