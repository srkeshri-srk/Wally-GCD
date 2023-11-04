//
//  HomeLandingViewModel.swift
//  Wally GCD
//
//  Created by Shreyansh Raj  Keshri on 01/11/23.
//

import Foundation


class HomeLandingViewModel {
    private let urlSession = URLSessionNetworkLayer()
    private var dataModel = [Int: HomeLandingModel?]()
    private var completeUrl: String {
        return Constants.NetworkLayer.apiURL + "curated"
    }
    
    
    func hitAPIForSection(atPage number: Int, competion: (()->Void)? = nil) {
        guard let url = URL(string: completeUrl) else { return }
        
        let headers = ["Authorization" : Constants.NetworkLayer.apiKey]
        let queryParams = ["page": String(number), "per_page" : "10"]
        let apiRequest = APIRequest(url: url, method: .GET, headers: headers, queryParams: queryParams, body: nil)
        
        urlSession.dataTask(apiRequest) { [weak self] (_ result: Result<HomeLandingModel, NetworkError>) in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                assignData(key: number, value: data)
                competion?()
            case .failure(let error):
                debugPrint("Error : ", error)
                competion?()
            }
        }
    }
    
    private func assignData(key: Int, value: HomeLandingModel) {
        if dataModel[key] == nil {
            dataModel[key] = value
        }
    }
    
    func getInfo(at index: Int) -> [Photo]? {
        guard let dataModel = dataModel[index], let photos = dataModel?.photos else { return nil }
        return photos
    }
    
}
