//
//  DetailedCategoryView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/14/21.
//

import SwiftUI

struct DetailedCategoryView: View {
    
    @State var category: Category
    
    var body: some View {
        
        VStack {
            CategoryTitleView(category: category)
            
            ForEach(category.items.sorted(by: {$0.getNutritionCalorieValue(key: .calories) > $1.getNutritionCalorieValue(key: .calories)}), id: \.self) { food in
                
                // MARK: - Not the best for efficiency, but keep it for now
                
                if food.name != category.items.sorted(by: {$0.getNutritionCalorieValue(key: .calories) > $1.getNutritionCalorieValue(key: .calories)})[0].name {
                    Divider()
                }
                
                DetailedFoodCell(food: food)
                    .padding(.horizontal, 16)
            }
            .padding(.bottom, 8)
            
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.5), style: StrokeStyle(lineWidth: 2))
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct DetailedCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedCategoryView(category: getSampleCategory())
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
