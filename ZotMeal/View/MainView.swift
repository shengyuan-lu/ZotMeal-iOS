import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var restaurantModel: RestaurantModel
    
    @State var restaurantSelectionIndex: Int = 0
    
    @State var bannerHeight: CGFloat = 160
    
    var body: some View {
        
        NavigationView {
            
            if restaurantModel.restaurants.count > 0 {
                
                VStack(spacing: 16) {
                    
                    if restaurantModel.restaurants.count > 1 {
                        PageView(pages: generateRestaurantBanners(), currentPage: $restaurantSelectionIndex)
                            .frame(width: UIScreen.screenWidth, height: bannerHeight, alignment: .center)
                    } else {
                        RestaurantBannerView(restaurant: restaurantModel.restaurants[0], height: bannerHeight)
                            .frame(width: UIScreen.screenWidth, height: bannerHeight, alignment: .center)
                    }
                    
                    if restaurantModel.restaurants[restaurantSelectionIndex].allMenu.count > 0 {
                        
                        ScrollViewReader { sv in
                            ScrollView(.vertical, showsIndicators: true) {
                                VStack(spacing: 8) {
                                    ForEach(restaurantModel.restaurants[restaurantSelectionIndex].allMenu, id: \.self) { station in
                                        StationView(station: station)
                                            .padding(.leading, 12)
                                    }
                                }
                            }
                            .onChange(of: restaurantSelectionIndex) { _ in
                                withAnimation {
                                    sv.scrollTo(restaurantModel.restaurants[restaurantSelectionIndex].allMenu[0], anchor: .top)
                                }
                            }
                        }
                        
                    } else {
                        VStack {
                            Spacer()
                            
                            Text("No Menu Available")
                                .font(.title2)
                                .bold()
                            
                            Spacer()
                        }
                        
                    }
                }
                .navigationBarTitle("ZotMeal")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {

                        Button {
                            // FIXME: - Load real data in production
                            restaurantSelectionIndex = 0
                            restaurantModel.loadLocalDemoData()

                        } label: {
                            
                            HStack {
                                Image(systemName: "arrow.clockwise.circle.fill")
                                Text("Refresh")
                                    .bold()
                            }
                           
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "person.3.sequence.fill")
                        }
                        
                    }
                }
                
            } else {
                
                if restaurantModel.isLoadingFailed {
                    FailView()
                    
                } else {
                    LoadingView()
                    
                }
            }
        }
    }
    
    func generateRestaurantBanners() -> [RestaurantBannerView] {
        
        var bannerViews = [RestaurantBannerView]()
        
        for restaurant in restaurantModel.restaurants {
            bannerViews.append(RestaurantBannerView(restaurant: restaurant, height: bannerHeight))
        }
        
        return bannerViews
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
