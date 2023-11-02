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
    
    private func prepareURL(_ api: APIRequest) -> URL? {
        var urlComponents = URLComponents(string: api.url.absoluteString)
        let queryItems = api.queryParams?.map({ (key, value) in
            return URLQueryItem(name: key, value: String(describing: value) )
        })
        urlComponents?.queryItems = queryItems
        return urlComponents?.url
    }

    
    public func dataTask<T: Codable>(_ api: APIRequest, completion: @escaping (_ result: Result<T, NetworkError>) -> Void) {
        guard let url = prepareURL(api) else {
            return completion(.failure(.urlNotFound))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = api.method.rawValue
        urlRequest.allHTTPHeaderFields = api.headers
        urlRequest.httpBody = api.body
        
        self.urlSession.dataTask(with: urlRequest) { data, response, error in
            //Data Validation
            guard let data = data else {
                completion(.failure(.noDataFound))
                return
            }
            
            //Status Validation
            guard (200...299).contains((response as? HTTPURLResponse)?.statusCode ?? 0) else {
                completion(.failure(.httpFailure))
                return
            }
            
            //Parsing
            if let result: T = JSONParser().decode(data) {
                completion(.success(result))
            } else {
                completion(.failure(.dataCantParse))
            }
            
        }.resume()
    }
}
