import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var restaurantModel: RestaurantModel
    
    @State var restaurantSelectionIndex: Int = 0
    
    var body: some View {
        
        if isModelLoadingSuccessful() {
            
            NavigationView {
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    PageView(pages: generateRestaurantBanners(), currentPage: $restaurantSelectionIndex)
                        .frame(width: UIScreen.screenWidth, height: 180, alignment: .center)
                    
                    TabView(selection: $restaurantSelectionIndex) {
                        
                        ForEach(restaurantModel.restaurants, id: \.self) { restaurant in
                            RestaurantBannerView(restaurant: restaurant)
                                .padding(.bottom, 8)
                        }
                        
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    
                    
                    VStack(spacing: 12) {
                        ForEach(restaurantModel.restaurants[restaurantSelectionIndex].allMenu, id: \.self) { station in
                            StationView(station: station)
                        }
                    }
                    .padding(.leading, 12)
                }
                .navigationBarTitle("ZotMeal")
                .navigationBarTitleDisplayMode(.inline)
            }
            
        } else {
            FailView()
        }
    }
    
    func generateRestaurantBanners() -> [RestaurantBannerView] {
        
        var bannerViews = [RestaurantBannerView]()
        
        for restaurant in restaurantModel.restaurants {
            bannerViews.append(RestaurantBannerView(restaurant: restaurant))
        }
        
        return bannerViews
    }
    
    
    func isModelLoadingSuccessful() -> Bool {
        
        if restaurantModel.restaurants.count < 2 {
            
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
