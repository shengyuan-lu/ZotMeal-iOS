//
//  LoadJSON.swift
//  ZotMeal 2
//
//  Created by Shengyuan Lu on 10/14/21.
//

import Foundation

class LoadJSON {
    
    static func loadLocalJSON(forName name:String) -> Data? {
        
        do {
            
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileURL = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileURL)
                return data
            }
            
        } catch {
            print("Error when parsing local JSON: \(error)")
          
        }
        
        return nil
    }
}
