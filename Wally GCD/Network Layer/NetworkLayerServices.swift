//
//  NetworkLayerServices.swift
//  Wally GCD
//
//  Created by Shreyansh Raj  Keshri on 01/11/23.
//

import Foundation

final class NetworkLayerServices {
    let urlSession: URLSession
    private let configuration: URLSessionConfiguration
    
    init() {
        configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30.0
        configuration.httpAdditionalHeaders = ["Content-Type" : "application/json"]
        
        urlSession = URLSession(configuration: configuration)
    }
}
