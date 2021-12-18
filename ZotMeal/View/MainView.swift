import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var restaurantModel: RestaurantModel
    
    @State var restaurantSelectionIndex: Int = 0
    
    @State var bannerHeight: CGFloat = 160
    
    var body: some View {
        
        if isModelLoadingSuccessful() {
            
            NavigationView {
                
                VStack(spacing: 16) {
                    
                    if restaurantModel.restaurants.count > 1 {
                        PageView(pages: generateRestaurantBanners(), currentPage: $restaurantSelectionIndex)
                            .frame(width: UIScreen.screenWidth, height: bannerHeight, alignment: .center)
                    } else {
                        RestaurantBannerView(restaurant: restaurantModel.restaurants[0], height: bannerHeight)
                            .frame(width: UIScreen.screenWidth, height: bannerHeight, alignment: .center)
                    }
                    
                    ScrollViewReader { sv in
                        ScrollView(.vertical, showsIndicators: true) {
                            VStack(spacing: 8) {
                                ForEach(restaurantModel.restaurants[restaurantSelectionIndex].allMenu, id: \.self) { station in
                                    StationView(station: station)
                                        .padding(.leading, 12)
                                }
                            }
                            
                            
                        }
                        .navigationBarTitle("ZotMeal")
                        .navigationBarTitleDisplayMode(.inline)
                        .onChange(of: restaurantSelectionIndex) { _ in
                            withAnimation {
                                sv.scrollTo(restaurantModel.restaurants[restaurantSelectionIndex].allMenu[0], anchor: .top)
                            }
                        }
                    }
                }
            }
            
        } else {
            FailView()
        }
    }
    
    func generateRestaurantBanners() -> [RestaurantBannerView] {
        
        var bannerViews = [RestaurantBannerView]()
        
        for restaurant in restaurantModel.restaurants {
            bannerViews.append(RestaurantBannerView(restaurant: restaurant, height: bannerHeight))
        }
        
        return bannerViews
    }
    
    
    func isModelLoadingSuccessful() -> Bool {
        
        if restaurantModel.restaurants.count == 0 {
            
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
