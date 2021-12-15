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
        reloadData()
    }
    
    func loadDemoData() {
        
        var data: Data?
        
        data = LoadJSON().loadLocalJSON(forName: "brandy_dummy_data")
        
        loadRestaurant(data: data)
    }
    
    func reloadData() {
        
        var data: Data?
        
        data = LoadJSON().loadRemoteJSON(forURL: Constants.brandyURL)
            
        loadRestaurant(data: data)
    }
    
    
    func loadRestaurant(data: Data?) -> Void {
        let decoder = JSONDecoder()
        
        do {
            
            if let d = data {
                self.restaurant = try decoder.decode(Restaurant.self, from: d)
            }
            
            print("Convert JSON to restaurant object successfully")
        } catch {
            print (error)
        }
    }
}
