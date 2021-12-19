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
    @Published var isLoadingFailed: Bool = false
    
    let remoteJSONnames: [String] = [Constants.brandyURL, Constants.anteateryURL]
    let localJSONnames: [String] = [Constants.brandyDummyName, Constants.antearyDummyName]
    
    init() {
        // MARK: - This needs to be changed to loading real data in production
        loadRemoteRealData()
    }
    
    func loadRemoteRealData() {
        
        self.restaurants.removeAll()
        
        for name in remoteJSONnames {
            
            loadRemoteJSON(forURL: name) { data in
                if let d = data {
                    self.loadRestaurant(data: d)
                }
            }
            
        }
    }
    
    func loadRemoteDemoData() {
        
        self.restaurants.removeAll()
        
        for _ in 0...2 {
            loadRemoteJSON(forURL: Constants.remoteDemoJsonURL) { data in
                if let d = data {
                    self.loadRestaurant(data: d)
                }
            }
        }
    }
    
    func loadLocalDemoData() {
        
        self.restaurants.removeAll()
        
        for name in localJSONnames {
            let data: Data? =  loadLocalJSON(forName: name)
            self.loadRestaurant(data: data)
        }
        
    }
    
    // MARK: - JSON Parsing
    func loadRestaurant(data: Data?) -> Void {
        let decoder = JSONDecoder()
        
        do {
            
            if let d = data {
                self.restaurants.append(try decoder.decode(Restaurant.self, from: d))
                
                self.isLoadingFailed = false
                print("Success: converted JSON to restaurant object (name: \(self.restaurants.last!.restaurantName))")
            }
            
        } catch {
            
            self.isLoadingFailed = true
            print("Failed: can't convert JSON to restaurant object")
            
        }
    }
    
    // JSON loading
    func loadLocalJSON(forName name:String) -> Data? {
        
        do {
            
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileURL = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileURL)
                
                print("Success: Load local JSON (name \(name) succeessfully)")
                
                return data
            }
            
        } catch {
            self.isLoadingFailed = true
            print("Failed: Can't parse local JSON: \(error.localizedDescription)")
            
        }
        
        return nil
    }
    
    
    func loadRemoteJSON(forURL urlString: String, completionBlock: @escaping (Data?) -> Void) -> Void {
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            
            self.isLoadingFailed = true
            
            print("Failed: invalid url string \(urlString) when loading remote JSON")
            
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil || data == nil {
                
                self.isLoadingFailed = true
                
                print("Failed: There is an error in the API url sent")
                
                return
            }
            
            DispatchQueue.main.async {
                completionBlock(data)
            }
        }
        
        dataTask.resume()
    }
    
}
