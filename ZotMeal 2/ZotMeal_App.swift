//
//  ZotMeal_2App.swift
//  ZotMeal 2
//
//  Created by Shengyuan Lu on 10/12/21.
//

import SwiftUI

@main
struct ZotMeal_App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    let data = LoadJSON().loadLocalJSON(forName: "brandy_dummy_data")
                }
        }
    }
}
