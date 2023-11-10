//
//  URLRequestGenerator.swift
//  Wally GCD
//
//  Created by Shreyansh Raj  Keshri on 11/11/23.
//

import Foundation


protocol URLPreparable: AnyObject {
    func prepareURL(_ api: APIRequest) -> URL?
    func prepareURLRequest(with api: APIRequest) -> URLRequest?
}

extension URLPreparable {
    func prepareURL(_ api: APIRequest) -> URL? {
        var urlComponents = URLComponents(string: api.url.absoluteString)
        let queryItems = api.queryParams?.map({ (key, value) in
            return URLQueryItem(name: key, value: String(describing: value) )
        })
        urlComponents?.queryItems = queryItems
        return urlComponents?.url
    }
    
    func prepareURLRequest(with api: APIRequest) -> URLRequest? {
        guard let url = prepareURL(api) else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = api.method.rawValue
        urlRequest.allHTTPHeaderFields = api.headers
        urlRequest.httpBody = api.body
        return urlRequest
    }
}
