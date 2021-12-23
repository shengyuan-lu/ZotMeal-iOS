//
//  RestaurantBannerView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/13/21.
//

import SwiftUI

struct RestaurantBannerView: View {
    
    @State var restaurant: Restaurant
    
    let height: CGFloat
    
    var body: some View {
        
        ZStack {
            
            RestaurantBannerImage(imageName: restaurant.restaurantName, height: height)
            
            VStack {
                
                RestaurantStatus(restaurant: restaurant)
                
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
                        Text("Menu Updated: " + restaurant.getMenuUpdateTimeInString())
                            .foregroundColor(.white)
                            .shadow(color: Color.black, radius: 5, x: 5, y: 5)
                        
                        Spacer()
                    }
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 8)
            }
            
        }
        .frame(width: UIScreen.screenWidth, height: height, alignment: .center)
        
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
