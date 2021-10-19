//
//  Restaurant.swift
//  ZotMeal 2
//
//  Created by Shengyuan Lu on 10/19/21.
//

import Foundation

struct Restaurant: Codable {
    let refreshTime: Int?
    let restaurant: String?
    let all: [Station]?
}
