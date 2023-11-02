//
//  HomeLandingModel.swift
//  Wally GCD
//
//  Created by Shreyansh Raj  Keshri on 02/11/23.
//

import Foundation

// MARK: - HomeLandingModel
struct HomeLandingModel: Codable {
    let page, perPage: Int?
    let photos: [Photo]?
    let totalResults: Int?
    let nextPage, prevPage: String?
    
    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case photos
        case totalResults = "total_results"
        case nextPage = "next_page"
        case prevPage = "prev_page"
    }
}

// MARK: - Photo
struct Photo: Codable {
    let id, width, height: Int?
    let url: String?
    let photographer: String?
    let photographerURL: String?
    let photographerID: Int?
    let avgColor: String?
    let src: Src?
    let liked: Bool?
    let alt: String?
    
    enum CodingKeys: String, CodingKey {
        case id, width, height, url, photographer
        case photographerURL = "photographer_url"
        case photographerID = "photographer_id"
        case avgColor = "avg_color"
        case src, liked, alt
    }
}

// MARK: - Src
struct Src: Codable {
    let original, large2X, large, medium: String?
    let small, portrait, landscape, tiny: String?
    
    enum CodingKeys: String, CodingKey {
        case original
        case large2X = "large2x"
        case large, medium, small, portrait, landscape, tiny
    }
}
