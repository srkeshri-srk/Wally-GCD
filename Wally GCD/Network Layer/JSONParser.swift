//
//  JSONParser.swift
//  Wally GCD
//
//  Created by Shreyansh Raj  Keshri on 01/11/23.
//

import Foundation


public class JSONParser {
    private let decode = JSONDecoder()
    
    func decode<T: Decodable>(_ data: Data) -> T? {
        return try? decode.decode(T.self, from: data)
    }
}
