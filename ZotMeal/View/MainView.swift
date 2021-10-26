//
//  ContentView.swift
//  ZotMeal 2
//
//  Created by Shengyuan Lu on 10/12/21.
//

import SwiftUI

struct MainView: View {
    
    @State private var restaurant: Restaurant?
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                let data = LoadJSON().loadLocalJSON(forName: "brandy_dummy_data")
                loadRestaurant(data: data)
            }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
