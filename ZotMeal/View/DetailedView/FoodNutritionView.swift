//
//  FoodSpecView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/14/21.
//

import SwiftUI

struct FoodNutritionView: View {
    
    let food: Food
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(spacing: 16) {
                
                if food.getNutritionTFvalue(key: .isVegan) {
                    Image("Vegan")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                
                if food.getNutritionTFvalue(key: .isVegetarian) {
                    Image("Vegetarian")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                
                if food.getNutritionTFvalue(key: .isEatWell) {
                    Image("EatWell")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                
                if food.getNutritionTFvalue(key: .isPlantForward) {
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
        FoodNutritionView(food: getSampleFood())
    }
}
