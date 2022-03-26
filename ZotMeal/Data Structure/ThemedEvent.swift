//
//  ThemedEvents.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 3/26/22.
//

import Foundation

struct ThemedEvent: Decodable, Hashable {
    
    let date: String
    let name: String
    let service_start: Int
    let service_end: Int
    
    init(date: String, name: String, service_start: Int, service_end: Int) {
        self.date = date
        self.name = name
        self.service_start = service_start
        self.service_end = service_end
    }
    
    enum CodingKeys: String, CodingKey {
        case date
        case name
        case service_start
        case service_end
    }

}

func getSampleThemedEvents() -> [ThemedEvent] {
    return [ThemedEvent(date: "03/30/2099", name: "Sample Chips Day", service_start: 1100, service_end: 1500), ThemedEvent(date: "03/29/2099", name: "Sample Chips Day", service_start: 1100, service_end: 1500)]
}
