//
//  Category.swift
//  ZotMeal 2
//
//  Created by Shengyuan Lu on 10/19/21.
//

import Foundation

struct Category: Codable {
    let category: String
    let items: [Food]
    
    enum CodingKeys: String, CodingKey {
        case category
        case items
    }
}
