//
//  NutritionCategoryView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/18/21.
//

import SwiftUI

struct FoodNutritionCellView: View {
    
    let nutrtionName: String
    let nutritionValue: String
    
    var body: some View {
        
        VStack {
            HStack {
                Text(nutrtionName.camelCaseToWords().capitalized)
                    .bold()
                
                Spacer()
                
                Text(nutritionValue)
            }
            .font(.footnote)
        }

    }
    
}

struct FoodNutritionCellView_Previews: PreviewProvider {
    static var previews: some View {
        FoodNutritionCellView(nutrtionName: "totalFat", nutritionValue: "8")
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
