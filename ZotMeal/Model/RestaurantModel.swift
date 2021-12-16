//
//  RestaurantModel.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/12/21.
//

import Foundation
import SwiftUI

class RestaurantModel: ObservableObject {
    
    @Published var restaurants: [Restaurant] = [Restaurant]()
    
    init() {
        reloadData()
    }
    
    func reloadData() {
        
        self.restaurants.removeAll()
        
        let brandyData: Data? = LoadJSON().loadRemoteJSON(forURL: Constants.brandyURL)
        let antData: Data? = LoadJSON().loadRemoteJSON(forURL: Constants.anteateryURL)
            
        loadRestaurant(data: brandyData)
        loadRestaurant(data: antData)
    }
    
    func loadLocalDemoData() {
        
        self.restaurants.removeAll()
        
        let brandyData: Data? = LoadJSON().loadLocalJSON(forName: "brandy_dummy_data")
        let antData: Data? = LoadJSON().loadLocalJSON(forName: "anteatery_dummy_data")
        
        loadRestaurant(data: brandyData)
        loadRestaurant(data: antData)
    }
    
    func loadRemoteDemoData() {
        
        self.restaurants.removeAll()
        
        let brandyData: Data? = LoadJSON().loadRemoteJSON(forURL: Constants.remoteSampleJsonURL)
        let antData: Data? = LoadJSON().loadRemoteJSON(forURL: Constants.remoteSampleJsonURL)
        
        loadRestaurant(data: brandyData)
        loadRestaurant(data: antData)
    }
    
    
    func loadRestaurant(data: Data?) -> Void {
        let decoder = JSONDecoder()
        
        do {
            
            if let d = data {
                self.restaurants.append(try decoder.decode(Restaurant.self, from: d))
            }
            
            print("Convert JSON to restaurant object successfully")
            
        } catch {
            
            print (error)
            
        }
    }
}
