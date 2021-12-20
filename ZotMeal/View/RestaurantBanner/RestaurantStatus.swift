//
//  RestaurantStatus.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/19/21.
//

import SwiftUI

struct RestaurantStatus: View {
    
    var body: some View {
        
        HStack {
            
            Circle()
                .foregroundColor(.green)
                .frame(width: 10, height: 10, alignment: .center)
            
            Text("Open Now")
                .font(.body)
                .bold()
                .foregroundColor(.white)
            
            Text("Breakfast")
                .font(.body)
                .foregroundColor(.white)
        }
        .padding(.horizontal, 8)
        
    }
}

struct RestaurantStatus_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantStatus()
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Default Preview")
    }
}
