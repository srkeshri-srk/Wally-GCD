//
//  NetworkError.swift
//  Wally GCD
//
//  Created by Shreyansh Raj  Keshri on 01/11/23.
//

import Foundation

enum NetworkError: Error {
    case urlNotFound
    case dataCantParse
    case noDataFound
    case httpFailure
}
