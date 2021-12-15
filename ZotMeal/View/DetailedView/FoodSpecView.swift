//
//  FoodSpecView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/14/21.
//

import SwiftUI

struct FoodSpecView: View {
    
    let food: Food
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(spacing: 16) {
                
                if food.isVegan {
                    Image("Vegan")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                
                if food.isVegetarian {
                    Image("Vegetarian")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                
                if food.isEatWell {
                    Image("EatWell")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                
                if food.isPlantForward {
                    Image("PlantForward")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                
            }
        }
    }
    
}

struct FoodSpecView_Previews: PreviewProvider {
    static var previews: some View {
        FoodSpecView(food: getSampleFood())
    }
}
