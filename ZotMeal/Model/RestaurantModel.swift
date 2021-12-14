//
//  RestaurantModel.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/12/21.
//

import Foundation
import SwiftUI

class RestaurantModel: ObservableObject {
    
    @Published var restaurant: Restaurant?
    
    init() {
        let data = LoadJSON().loadLocalJSON(forName: "brandy_dummy_data")
        loadRestaurant(data: data)
    }
    
    func loadRestaurant(data: Data?) -> Void {
        let decoder = JSONDecoder()
        do {
            self.restaurant = try decoder.decode(Restaurant.self, from: data!)
            print("Convert JSON to restaurant object successfully")
        } catch {
            print (error)
        }
    }
}
