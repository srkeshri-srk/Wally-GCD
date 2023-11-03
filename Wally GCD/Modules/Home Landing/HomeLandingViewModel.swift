//
//  HomeLandingViewModel.swift
//  Wally GCD
//
//  Created by Shreyansh Raj  Keshri on 01/11/23.
//

import Foundation


class HomeLandingViewModel {
    private let urlSession = URLSessionNetworkLayer()
    private var dataModel: HomeLandingModel?
    
    var dataCount: Int {
        return dataModel?.photos?.count ?? 0
    }
    
    func hitAPIForSection(atPage number: Int, competion: (()->Void)? = nil) {
        guard let url = URL(string: "https://api.pexels.com/v1/curated") else { return }
        
        let headers = ["Authorization" : Constants.NetworkLayer.apiKey]
        let queryParams = ["page": String(number), "per_page" : "10"]
        let apiRequest = APIRequest(url: url, method: .GET, headers: headers, queryParams: queryParams, body: nil)
        
        urlSession.dataTask(apiRequest) { [weak self] (_ result: Result<HomeLandingModel, NetworkError>) in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                self.dataModel = data
                competion?()
            case .failure(let error):
                debugPrint("Error : ", error)
                competion?()
            }
        }
    }
    
}
