//
//  RestaurantBannerView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/13/21.
//

import SwiftUI

struct RestaurantBannerView: View {
    
    @EnvironmentObject var restaurantModel: RestaurantModel
    
    var body: some View {
        
        ZStack {
            
            Image(restaurantModel.restaurant?.restaurantName ?? "")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.screenWidth, height: 180, alignment: .center)
                .clipped()
            
            VStack {
                
                Spacer()
                
                HStack {
                    Text(restaurantModel.restaurant?.restaurantName ?? "")
                        .bold()
                        .font(.title)
                        .foregroundColor(.white)
                        .shadow(color: Color.black, radius: 5, x: 5, y: 5)
                        .padding(16)
                    
                    Spacer()
                }
            }
        }
        .frame(width: UIScreen.screenWidth, height: 180, alignment: .center)
    }
}

struct RestaurantBannerView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantBannerView()
            .environmentObject(RestaurantModel())
    }
}
