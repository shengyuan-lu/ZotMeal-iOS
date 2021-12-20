//
//  RestaurantBannerView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/13/21.
//

import SwiftUI

struct RestaurantBannerView: View {
    
    @State var restaurant: Restaurant
    
    let height: CGFloat?
    
    var body: some View {
        
        ZStack {
            
            ZStack{
                Image(restaurant.restaurantName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.screenWidth, height: height, alignment: .center)
                    .clipped()
                
                LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.4)]), startPoint: .center, endPoint: .bottom)
            }
            
            VStack {
                
                HStack {
                    
                    RestaurantStatus()
                    
                    Spacer()
                    
                    HStack(spacing: 12) {
                        NavigationLink {
                            Text("Schedule")
                                .navigationTitle(restaurant.restaurantName + " Schedule")
                                .navigationBarTitleDisplayMode(.inline)
                            
                        } label: {
                            Image(systemName: "calendar")
                                .shadow(color: Color.black, radius: 3, x: 3, y: 3)
                                .foregroundColor(.white)
                                .font(.title2)
                        }
                        
                        NavigationLink {
                            MapView(resaurant: restaurant)
                                .navigationTitle(restaurant.restaurantName + " Location")
                                .navigationBarTitleDisplayMode(.inline)
                            
                        } label: {
                            Image(systemName: "mappin.and.ellipse")
                                .shadow(color: Color.black, radius: 3, x: 3, y: 3)
                                .foregroundColor(.white)
                                .font(.title2)
                        }
                        
                        NavigationLink {
                            Text("Pricing")
                                .navigationTitle(restaurant.restaurantName + " Pricing")
                                .navigationBarTitleDisplayMode(.inline)
                            
                        } label: {
                            Image(systemName: "dollarsign.circle.fill")
                                .shadow(color: Color.black, radius: 3, x: 3, y: 3)
                                .foregroundColor(.white)
                                .font(.title2)
                        }
                    }
                    
                }
                .padding(8)
                .background(Color.black.opacity(0.6))
                .clipShape(RoundedRectangle(cornerRadius: 0))
                
                Spacer()
                
                VStack {
                    HStack {
                        Text(restaurant.restaurantName)
                            .bold()
                            .font(.title)
                            .foregroundColor(.white)
                            .shadow(color: Color.black, radius: 5, x: 5, y: 5)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("Menu Updated: " + getMenuUpdateTimeInString())
                            .foregroundColor(.white)
                            .shadow(color: Color.black, radius: 5, x: 5, y: 5)
                        
                        Spacer()
                    }
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
            }
            
        }
        .frame(width: UIScreen.screenWidth, height: height, alignment: .center)
        
    }
    
    func getMenuUpdateTimeInString() -> String {
        let date = restaurant.refreshTime
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: date)
    }
}

struct RestaurantBannerView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantBannerView(restaurant: getEmptyRestaurant(), height: 160)
            .environmentObject(RestaurantModel())
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Default Preview")
    }
}
