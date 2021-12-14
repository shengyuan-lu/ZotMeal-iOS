//
//  Station.swift
//  ZotMeal 2
//
//  Created by Shengyuan Lu on 10/19/21.
//

import Foundation

struct Station: Codable, Hashable {
    let station: String
    let menu: [Category]
    
    enum CodingKeys: String, CodingKey {
        case station
        case menu
    }
    
    init(station: String, menu: [Category]) {
        self.station = station
        self.menu = menu
    }
    
}

func getSampleStation() -> Station {
    var categoryArray = [Category]()
    
    for _ in 0...8 {
        categoryArray.append(getSampleCategory())
    }
    
    return Station(station: "Ember / Grill", menu: categoryArray)
}

