import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var restaurantModel: RestaurantModel
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                RestaurantBannerView()
                    .navigationBarTitle("ZotMeal")
                    .padding(.bottom, 8)
                
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(spacing: 20) {
                        ForEach(restaurantModel.restaurant!.allMenu, id: \.self) { station in
                            StationView(station: station)
                        }
                    }
                }
                .padding(.leading, 10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
