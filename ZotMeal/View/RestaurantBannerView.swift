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
                .frame(width: UIScreen.screenWidth, height: 120, alignment: .center)
                .clipped()
            
            VStack {
                HStack {
                    Text(restaurantModel.restaurant?.restaurantName ?? "")
                        .bold()
                        .font(.title2)
                        .foregroundColor(.white)
                        .shadow(color: Color.black, radius: 1, x: 1, y: 1)
                        .padding(10)
                    
                    Spacer()
                }
                Spacer()
            }
        }
        .frame(width: UIScreen.screenWidth, height: 120, alignment: .center)
    }
}

struct RestaurantBannerView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantBannerView()
            .environmentObject(RestaurantModel())
    }
}
