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
    
    let remoteJSONnames: [String] = [Links.brandyURL, Links.anteateryURL]
    let localJSONnames: [String] = [Links.brandyDummyName, Links.antearyDummyName]
    
    init() {
        self.load()
    }
    
    func load() {
        
        // FIXME: - Load real data in production
        self.loadLocalDemoData()
    }
    
    func loadRemoteRealData() {
        
        self.restaurants.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            for url in self.remoteJSONnames {
                self.loadRemoteJSON(forURL: url) { data in
                    if let d = data {
                        self.loadRestaurant(data: d)
                    }
                }
                print("Success: load remote JSON (URL: \(url) to data succeessfully)")
            }
        }
    }
    
    func loadRemoteDemoData() {
        
        self.restaurants.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            for _ in 0...1 {
                self.loadRemoteJSON(forURL: Links.remoteDemoJsonURL) { data in
                    if let d = data {
                        self.loadRestaurant(data: d)
                    }
                }
                
                print("Success: load remote sample JSON to data succeessfully)")
            }
        }
    }
    
    func loadLocalDemoData() {
        
        self.restaurants.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            for name in self.localJSONnames {
                let data: Data? =  self.loadLocalJSON(forName: name)
                self.loadRestaurant(data: data)
            }
            
            print("Success: load local sample JSON to data succeessfully)")
        }
    }
    
    // MARK: - JSON Parsing
    func loadRestaurant(data: Data?) -> Void {
        let decoder = JSONDecoder()
        
        do {
            
            if let d = data {
                self.restaurants.append(try decoder.decode(Restaurant.self, from: d))
                
                self.isLoadingFailed = false
                print("Success: converted JSON data to restaurant object (name: \(self.restaurants.last!.restaurantName))")
            }
            
        } catch {
            
            self.isLoadingFailed = true
            print("Failed: can't convert JSON data to restaurant object")
            
        }
    }
    
    // JSON loading
    func loadLocalJSON(forName name:String) -> Data? {
        
        do {
            
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileURL = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileURL)
                
                print("Success: load local JSON (name \(name) to data succeessfully)")
                
                return data
            }
            
        } catch {
            self.isLoadingFailed = true
            print("Failed: Can't parse local JSON to data: \(error.localizedDescription)")
            
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
                
                DispatchQueue.main.async {
                    self.isLoadingFailed = true
                }
                
                print("Failed: Can't get data task with URL \(url!)")
                
                return
            }
            
            DispatchQueue.main.async {
                completionBlock(data)
            }
        }
        
        dataTask.resume()
    }
    
}
