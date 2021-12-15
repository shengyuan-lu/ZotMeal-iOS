//
//  DetailedCategoryScrollableView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/14/21.
//

import SwiftUI

struct DetailedCategoryScrollableView: View {
    
    @State var category: Category
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                CategoryTitleView(category: category)
                
                ForEach(category.items.sorted(by: {$0.calories > $1.calories}), id: \.self) { food in
                    Divider()
                    
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
            .navigationTitle("Detail")
            .padding(.bottom, 8)
            .padding([.horizontal, .bottom], 16)
        }
        
    }
}

struct DetailedCategoryScrollableView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedCategoryScrollableView(category: getSampleCategory())
    }
}
