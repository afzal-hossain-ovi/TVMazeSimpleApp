//
//  ShowModel.swift
//  Simple App (TV MAZE)
//
//  Created by Afzal Hossain on 05.05.21.
//

import Foundation

// MARK: - Show Element
struct ShowModel: Codable {
    let show: Show
}

// MARK: - Show
struct Show: Codable {
    let name: String
    let url: String
    var officialSite: String?
    let language: String
    let rating: Rating
    let image: ImageType?
    let summary: String
}

// MARK: - Image
struct ImageType: Codable {
    let medium, original: String
}

// MARK: - Rating
struct Rating: Codable {
    let average: Double?
}
