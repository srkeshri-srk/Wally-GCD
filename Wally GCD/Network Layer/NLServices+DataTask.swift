//
//  NLServices+DataTask.swift
//  Wally GCD
//
//  Created by Shreyansh Raj  Keshri on 11/11/23.
//

import Foundation


extension NetworkLayerServices: URLPreparable {
    public func dataTask<T: Codable>(_ api: APIRequest, completion: @escaping (_ result: Result<T, NetworkError>) -> Void) {
        guard let urlRequest = prepareURLRequest(with: api) else {
            return completion(.failure(.urlNotFound))
        }
                    
        self.urlSession.dataTask(with: urlRequest) { data, response, error in
            //Data Validation
            guard let data = data else {
                completion(.failure(.noDataFound))
                return
            }
            
            //Status Validation
            guard let response = response as? HTTPURLResponse, (200..<300) ~= response.statusCode else {
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
