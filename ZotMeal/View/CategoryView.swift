//
//  CategoryView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/13/21.
//

import SwiftUI

struct CategoryView: View {
    
    @State var category: Category
    @State var showMore: Bool = false
    @Binding var isExpanded: Bool
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            CategoryTitleView(category: category)
            
            VStack {
                HStack {
                    Text("Dish")
                        .font(.footnote)
                    
                    Spacer()
                    
                    Text("Calories")
                        .font(.footnote)
                }
                
                ForEach(returnItemArray(), id: \.self) { food in
                    Divider()
                    
                    SimpleFoodCell(food: food)
                        .padding(.vertical, 2)
                }
                
                Spacer()
                
                if category.items.count > 4 {
                    
                    Divider()
                    
                    ExpandButtonView(isExpanded: $isExpanded)
                        .padding(.bottom, 8)
                }
            }
            .padding(.horizontal, 8)
            
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.5), style: StrokeStyle(lineWidth: 2))
        )
        .background(Color(UIColor(named: "categoryBG")!))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .frame(width: 220)
    }
    
    func returnItemArray() -> [Food] {
        if !isExpanded {
            return Array(category.items.sorted(by: {$0.getNutritionCalorieValue(key: .calories) > $1.getNutritionCalorieValue(key: .calories)}).prefix(4))
        } else {
            return category.items.sorted(by: {$0.getNutritionCalorieValue(key: .calories) > $1.getNutritionCalorieValue(key: .calories)})
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: getSampleCategory(), isExpanded: Binding.constant(true))
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
