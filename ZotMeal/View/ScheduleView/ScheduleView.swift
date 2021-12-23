//
//  ScheduleView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/22/21.
//

import SwiftUI

struct ScheduleView: View {
    
    @State var restaurant: Restaurant
    
    let height: CGFloat = 180
    
    var body: some View {
        
        VStack {
            
            ZStack {
                RestaurantBannerImage(imageName: restaurant.restaurantName, height: height)
                
                VStack {
                    Spacer()
                    
                    VStack(spacing: 4) {
                        HStack {
                            Text(restaurant.restaurantName)
                                .bold()
                                .font(.title)
                                .foregroundColor(.white)
                                .shadow(color: Color.black, radius: 5, x: 5, y: 5)
                            
                            Spacer()
                        }
                        
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Color.black.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 0))
                    
                }
                
            }
            .frame(width: UIScreen.screenWidth, height: height, alignment: .center)
            
            Spacer()
            
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView(restaurant: getEmptyRestaurant())
    }
}
