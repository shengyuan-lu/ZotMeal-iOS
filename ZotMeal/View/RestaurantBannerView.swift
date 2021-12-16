//
//  RestaurantBannerView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/13/21.
//

import SwiftUI

struct RestaurantBannerView: View {
    
    @State var restaurant: Restaurant
    
    var body: some View {
        
        ZStack {
            
            ZStack{
                Image(restaurant.restaurantName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.screenWidth, height: 180, alignment: .center)
                    .clipped()
                
                LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .center, endPoint: .bottom)
            }
            
            VStack {
                
                Spacer()
                
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
        .frame(width: UIScreen.screenWidth, height: 180, alignment: .center)
        
        
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
        RestaurantBannerView(restaurant: getEmptyRestaurant())
            .environmentObject(RestaurantModel())
    }
}
