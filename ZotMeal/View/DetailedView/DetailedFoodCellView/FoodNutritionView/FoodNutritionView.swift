//
//  FoodNutritionView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/18/21.
//

import SwiftUI

struct FoodNutritionView: View {
    
    let food: Food
    
    var body: some View {
        
        ForEach(food.nutrtionCellList.keys.sorted(), id: \.self) { key in
            
            Divider()
            
            if let value = food.nutrtionCellList[key] {
                FoodNutritionCellView(nutrtionName: key, nutritionValue: String(value))
            }
            
        }
        
        if food.hasBadge() {
            Divider()
            
            FoodBadgeView(food: food)
        }
    }
}

struct FoodNutritionView_Previews: PreviewProvider {
    
    static var previews: some View {
        FoodNutritionView(food: getSampleFood())
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
        
    }
}
