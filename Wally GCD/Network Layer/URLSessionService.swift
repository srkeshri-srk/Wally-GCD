//
//  URLSessionService.swift
//  Wally GCD
//
//  Created by Shreyansh Raj  Keshri on 01/11/23.
//

import Foundation


final class URLSessionNetworkLayer {
    private var urlSession: URLSession
    private var configuration: URLSessionConfiguration
    
    init() {
        configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30.0
        configuration.httpAdditionalHeaders = ["Content-Type" : "application/json"]
        
        urlSession = URLSession(configuration: configuration)
    }
    
    public func dataTask<T: Codable>(_ urlString: String, completion: @escaping (_ result: Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.urlNotFound))
            return
        }
        
        let urlRequest = URLRequest(url: url)
        self.urlSession.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else {
                completion(.failure(.noDataFound))
                return
            }
            
            if let result: T = JSONParser().decode(data) {
                completion(.success(result))
            } else {
                completion(.failure(.dataCantParse))
            }
            
        }.resume()
    }
}
