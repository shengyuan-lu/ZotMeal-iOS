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
    
    let allMenu: [Station]
    let schedule: [String : [String : Int]]
    let pricing: [String : Double]
    
    enum CodingKeys: String, CodingKey {
        case refreshTime
        case restaurantName = "restaurant"
        case allMenu = "all"
        case mealType = "currentMeal"
        case schedule = "schedule"
        case pricing = "price"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let unixTime = try container.decode(Int.self, forKey: .refreshTime)
        let all = try container.decode([Station].self, forKey: .allMenu)
        let mealType = try container.decode(String.self, forKey: .mealType).capitalized
        let schedule = try container.decode([String : [String : Int]].self, forKey: .schedule)
        let pricing = try container.decode([String : Double].self, forKey: .pricing)
        
        self.refreshTime = Date(timeIntervalSince1970: Double(unixTime))
        self.restaurantName = try container.decode(String.self, forKey: .restaurantName)
        self.allMenu = all
        self.mealType = mealType
        self.schedule = schedule
        self.pricing = pricing
    }
    
    init(refreshTime: Date, restaurantName: String, mealType: String, allMenu: [Station], schedule: [String : [String : Int]], pricing: [String : Double]) {
        self.refreshTime = refreshTime
        self.restaurantName = restaurantName
        self.allMenu = allMenu
        self.mealType = mealType
        self.schedule = schedule
        self.pricing = pricing
    }
    
    func getMenuUpdateTimeInString() -> String {
        let date = refreshTime
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: date)
    }
    
}

func getEmptyRestaurant() -> Restaurant {
    let emptyMenu = [Station]()
    let sampleSchedule: [String : [String : Int]] = ["breakfast" : ["start" : 715, "end": 1100], "lunch" : ["start" : 1100, "end": 1630], "dinner" : ["start" : 1630, "end": 2200]]
    let samplePricing: [String : Double] = ["breakfast" : 9.75, "lunch" : 13.75, "brunch" : 13.75, "dinner" : 14.95]
    
    return Restaurant(refreshTime: Date(), restaurantName: "Sample", mealType: "Lunch", allMenu: emptyMenu, schedule: sampleSchedule, pricing: samplePricing)
}
