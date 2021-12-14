//
//  CategoryView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/13/21.
//

import SwiftUI

struct CategoryView: View {
    
    @State var category: Category
    
    let buttonText: String = "View All"
    
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
                
                Divider()
                
                ForEach(category.items.prefix(4).sorted(by: {$0.calories > $1.calories}), id: \.self) { food in
                    FoodCell(food: food)
                        .padding(.vertical, 2)
                    Divider()
                }
                
                Spacer()
            }
            .padding(.horizontal, 8)
            
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.5), style: StrokeStyle(lineWidth: 2))
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .frame(width: 220)
    }
    
    
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: getSampleCategory())
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
