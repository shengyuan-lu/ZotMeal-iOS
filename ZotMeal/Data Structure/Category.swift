//
//  Category.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 10/19/21.
//

import Foundation

struct Category: Decodable, Hashable {
    let category: String
    var items: [Food]
    
    enum CodingKeys: String, CodingKey {
        case category
        case items
    }
    
    init(category: String, items: [Food]) {
        self.category = category
        self.items = items
    }
}

func getSampleCategory() -> Category {
    
    var foodArray = [Food]()
    
    for _ in 0...3 {
        foodArray.append(getSampleFood())
    }
    
    return Category(category: "Condiments", items: foodArray)
}


