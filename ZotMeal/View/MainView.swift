import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var restaurantModel: RestaurantModel
    
    var body: some View {
        
        NavigationView {
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    VStack {
                        RestaurantBannerView()
                            .padding(.bottom, 8)
                        
                    VStack(spacing: 24) {
                        ForEach(restaurantModel.restaurant?.allMenu ?? getEmptyRestaurant().allMenu, id: \.self) { station in
                            StationView(station: station)
                        }
                    }
                    .padding(.leading, 16)
                }

            }
            .navigationBarTitle("ZotMeal")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
