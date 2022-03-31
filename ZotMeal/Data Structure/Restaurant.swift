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
    let dateString: String
    
    let allMenu: [Station]
    let schedule: [String : [String : Int]]
    let pricing: [String : Double]
    var events: [ThemedEvent]
    
    enum CodingKeys: String, CodingKey {
        case refreshTime
        case restaurantName = "restaurant"
        case dateString = "date"
        case allMenu = "all"
        case mealType = "currentMeal"
        case schedule = "schedule"
        case pricing = "price"
        case events = "themed"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let unixTime = try container.decode(Int.self, forKey: .refreshTime)
        let all = try container.decode([Station].self, forKey: .allMenu)
        let dateString = try container.decode(String.self, forKey: .dateString)
        let mealType = try container.decode(String.self, forKey: .mealType).capitalized
        let schedule = try container.decode([String : [String : Int]].self, forKey: .schedule)
        let pricing = try container.decode([String : Double].self, forKey: .pricing)
        let events = try container.decode([ThemedEvent].self, forKey: .events)
        
        self.refreshTime = Date(timeIntervalSince1970: Double(unixTime))
        self.restaurantName = try container.decode(String.self, forKey: .restaurantName)
        self.allMenu = all
        self.mealType = mealType
        self.schedule = schedule
        self.pricing = pricing
        self.events = events
        self.dateString = dateString
        
        resetThemedEvents()
    }
    
    init(refreshTime: Date, dateString: String, restaurantName: String, mealType: String, allMenu: [Station], schedule: [String : [String : Int]], pricing: [String : Double], events: [ThemedEvent]) {
        self.refreshTime = refreshTime
        self.restaurantName = restaurantName
        self.allMenu = allMenu
        self.mealType = mealType
        self.schedule = schedule
        self.pricing = pricing
        self.events = events
        self.dateString = dateString
        
        resetThemedEvents()
    }
    
    func getMenuUpdateTimeInString() -> String {
        let date = refreshTime
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: date)
    }
    
    mutating func resetThemedEvents() -> Void {
        if checkIfThemedEventEmpty() {
            self.events.removeAll()
        }
    }
    
    
    func checkIfThemedEventEmpty() -> Bool {
        if self.events.count == 0 {
            return true
        } else {
            for e in self.events {
                if e.name == "placeholder" || e.name == "No more events this month" {
                    return true
                }
            }
            
            return false
        }
    }
    
}

func getEmptyRestaurant() -> Restaurant {
    let emptyMenu = [Station]()
    let sampleSchedule: [String : [String : Int]] = ["breakfast" : ["start" : 715, "end": 1100], "lunch" : ["start" : 1100, "end": 1630], "dinner" : ["start" : 1630, "end": 2200]]
    let samplePricing: [String : Double] = ["breakfast" : 9.75, "lunch" : 13.75, "brunch" : 13.75, "dinner" : 14.95]
    
    return Restaurant(refreshTime: Date(), dateString: "04/7/2022", restaurantName: "Sample", mealType: "Lunch", allMenu: emptyMenu, schedule: sampleSchedule, pricing: samplePricing, events: getSampleThemedEvents())
}
