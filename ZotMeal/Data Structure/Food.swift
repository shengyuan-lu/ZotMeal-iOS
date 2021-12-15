//
//  Food.swift
//  ZotMeal 2
//
//  Created by Shengyuan Lu on 10/19/21.
//

import Foundation
import UIKit

struct Food: Codable, Hashable {
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
    
    init(name: String, calories: Int, description: String, isVegan: Bool, isVegetarian: Bool, isEatWell: Bool, isPlantForward: Bool, isWholeGrains: Bool) {
        self.name = name
        self.calories = calories
        self.description = description
        self.isVegan = isVegan
        self.isVegetarian = isVegetarian
        self.isEatWell = isEatWell
        self.isPlantForward = isPlantForward
        self.isWholeGrains = isWholeGrains
    }
    
}

func getSampleFood() -> Food {
    return Food(name: "Beijing Duck", calories: 199, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", isVegan: true, isVegetarian: false, isEatWell: true, isPlantForward: false, isWholeGrains: false)
}
