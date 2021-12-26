import SwiftUI

struct ZotMealMainView: View {
    
    @EnvironmentObject var restaurantModel: RestaurantModel
    
    @State var restaurantSelectionIndex: Int = 0
    
    @State var bannerHeight: CGFloat = 160
    
    var body: some View {
        
        NavigationView {
            
            if restaurantModel.restaurants.count > 0 {
                
                VStack(spacing: 12) {
                    
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
                                VStack(spacing: 6) {
                                    ForEach(restaurantModel.restaurants[restaurantSelectionIndex].allMenu, id: \.self) { station in
                                        StationView(station: station)
                                            .padding(.leading, 8)
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
                            
                            Text("Menu Not Available")
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
                            restaurantSelectionIndex = 0
                            restaurantModel.load()

                        } label: {
                            
                            HStack {
                                Image(systemName: "arrow.clockwise.circle.fill")
                                Text("Refresh")
                                    .bold()
                            }
                           
                        }
                    }
                    
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        
                        NavigationLink {
                            PassView()
                                .navigationTitle("Zot Pass")
                            
                        } label: {
                            Image(systemName: "wallet.pass.fill")
                                .offset(x: 15)
                        }
                        
                        NavigationLink {
                            
                        } label: {
                            Image(systemName: "person.2.fill")
                                
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

struct ZotMealMainView_Previews: PreviewProvider {
    static var previews: some View {
        ZotMealMainView()
            .environmentObject(RestaurantModel())
    }
}
