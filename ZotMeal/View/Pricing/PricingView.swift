//
//  PricingView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/21/21.
//

import SwiftUI

struct PricingView: View {
    
    @State var restaurant: Restaurant
    
    let height: CGFloat = 240
    
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
                        
                        ExDivider()
                        
                        HStack {
                            Text("Meal Type")
                            
                            Spacer()
                            
                            Text("Price")
                        }
                        .font(.body)
                        .foregroundColor(.white)
                        .shadow(color: Color.black, radius: 5, x: 5, y: 5)
                        
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Color.black.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 0))
                    
                }
                
            }
            .frame(width: UIScreen.screenWidth, height: height, alignment: .center)
            
            VStack {
                ScrollView {
                    
                    ForEach(Array(restaurant.pricing.keys).sorted(by: { restaurant.pricing[$0]! < restaurant.pricing[$1]! }), id: \.self) { key in
                        PricingListCell(item: key.capitalized, price: getPrice(for: key))
                    }
                    
                    HStack {
                        Text("Meal plan holders: Please refer to terms and conditions of your specific meal plan.")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        
                        Spacer()
                    }
                    
                    
                }
            }
            .padding(.top, 4)
            .padding(.horizontal, 12)
            
            Spacer()
            
        }
        
    }
    
    func getPrice(for key: String) -> Double {
        
        var price: Double = 0
        
        if let pr = restaurant.pricing[key] {
            price = pr
        }
        
        return price
    }
    
    
}

struct PricingView_Previews: PreviewProvider {
    static var previews: some View {
        PricingView(restaurant: getEmptyRestaurant())
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
