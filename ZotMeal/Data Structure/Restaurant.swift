//
//  Restaurant.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 10/19/21.
//

import Foundation

struct Restaurant: Decodable, Hashable {
    let refreshTime: Date
    let restaurantName: String
    let mealType: String
    
    var allMenu: [Station]
    var schedule: [String : [String : Int]]
    
    enum CodingKeys: String, CodingKey {
        case refreshTime
        case restaurantName = "restaurant"
        case allMenu = "all"
        case mealType = "currentMeal"
        case schedule = "schedule"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let unixTime = try container.decode(Int.self, forKey: .refreshTime)
        let all = try container.decode([Station].self, forKey: .allMenu)
        let mealType = try container.decode(String.self, forKey: .mealType).capitalized
        let schedule = try container.decode([String : [String : Int]].self, forKey: .schedule)
        
        
        self.refreshTime = Date(timeIntervalSince1970: Double(unixTime))
        self.restaurantName = try container.decode(String.self, forKey: .restaurantName)
        self.allMenu = all
        self.mealType = mealType
        self.schedule = schedule
    }
    
    init(refreshTime: Date, restaurantName: String, mealType: String, allMenu: [Station], schedule: [String : [String : Int]]) {
        self.refreshTime = refreshTime
        self.restaurantName = restaurantName
        self.allMenu = allMenu
        self.mealType = mealType
        self.schedule = schedule
    }
    
}

func getEmptyRestaurant() -> Restaurant {
    let emptyMenu = [Station]()
    let schedule: [String : [String : Int]] = ["breakfast" : ["start" : 715, "end": 1100], "lunch" : ["start" : 1100, "end": 1630], "dinner" : ["start" : 1630, "end": 2200]]
    return Restaurant(refreshTime: Date(), restaurantName: "", mealType: "Lunch", allMenu: emptyMenu, schedule: schedule)
}
