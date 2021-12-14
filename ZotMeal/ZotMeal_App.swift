import SwiftUI

@main
struct ZotMeal_App: App {
    
    @StateObject var restaurantModel:RestaurantModel = RestaurantModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(restaurantModel)
        }
    }
}
