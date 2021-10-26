//
//  Food.swift
//  ZotMeal 2
//
//  Created by Shengyuan Lu on 10/19/21.
//

import Foundation

struct Food: Codable {
    let name: String
    let calories: Int
    let description: String
    let isVegan: Bool
    let isVegetarian: Bool
    let isEatWell: Bool
    let isPlantForward: Bool
    let isWholeGrains: Bool
    
    enum CodingKeys: String, CodingKey {
        case name
        case calories
        case description
        case isVegan
        case isVegetarian
        case isEatWell
        case isPlantForward
        case isWholeGrains
    }
}
