//
//  HomeLandingViewModel.swift
//  Wally GCD
//
//  Created by Shreyansh Raj  Keshri on 01/11/23.
//

import Foundation

class HomeLandingViewModel {
    private let urlSession = URLSessionNetworkLayer()
    
    func hitAPIForSection(_ urlString: String, competion: @escaping ()->Void) {
        guard let url = URL(string: urlString) else { return }
        
        let headers = ["Content-Type" : "application/json", "Authorization" : Constants.NetworkLayer.apiKey]
        let apiRequest = APIRequest(url: url, method: .GET, headers: headers, queryParams: nil, body: nil)
        
        urlSession.dataTask(apiRequest) { (_ result: Result<HomeLandingModel, NetworkError>) in
            switch result {
            case .success(let data):
                competion()
            case .failure(let error):
                debugPrint("Error : ", error)
                competion()
            }
        }
    }
    
}
