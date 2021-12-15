import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var restaurantModel: RestaurantModel
    
    var body: some View {
        
        if isModelLoadingSuccessful() {
            
            NavigationView {
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    VStack {
                        RestaurantBannerView()
                            .padding(.bottom, 8)
                        
                        VStack(spacing: 12) {
                            ForEach(restaurantModel.restaurant?.allMenu ?? getEmptyRestaurant().allMenu, id: \.self) { station in
                                StationView(station: station)
                            }
                        }
                        .padding(.leading, 12)
                    }
                    
                }
                .navigationBarTitle("ZotMeal")
                .navigationBarTitleDisplayMode(.inline)
            }
            
        } else {
            Text("Something went wrong. Menu can't be loaded.")
        }
    }
    
    func isModelLoadingSuccessful() -> Bool {
        
        if (restaurantModel.restaurant?.refreshTime == nil || restaurantModel.restaurant?.restaurantName == nil || restaurantModel.restaurant?.allMenu == nil) {
            return false
            
        } else {
            return true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
