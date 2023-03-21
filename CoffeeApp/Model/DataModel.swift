//
//  DataModel.swift
//  CoffeeApp
//
//  Created by Mac-OBS-18 on 21/03/23.
//

import Foundation

// MARK: - Coffee Model

struct Coffee: Codable {
    let title, description: String
    let ingredients: [String]
    let image: String
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case ingredients
        case image
        case id
        
    }
}
