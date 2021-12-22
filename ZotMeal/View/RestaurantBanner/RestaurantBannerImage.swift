//
//  RestaurantBannerImage.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/21/21.
//

import SwiftUI

struct RestaurantBannerImage: View {
    
    let imageName: String
    let height: Double
    
    var body: some View {
        ZStack{
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.screenWidth, height: height, alignment: .center)
                .clipped()
            
            LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.4)]), startPoint: .center, endPoint: .bottom)
        }
    }
}

struct RestaurantBannerImage_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantBannerImage(imageName: "Brandywine", height: 160)
    }
}
