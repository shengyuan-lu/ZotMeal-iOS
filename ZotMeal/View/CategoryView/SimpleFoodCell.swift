//
//  FoodCell.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/13/21.
//

import SwiftUI

struct SimpleFoodCell: View {
    
    @State var food: Food
    @State var presentDetail: Bool = false
    
    var body: some View {
        
        HStack {
            Text(food.name)
                .bold()
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer()
            
            Text(String(food.getNutritionCalorieValue(key: .calories)))
                .padding(.leading, 4)
            
            NavigationLink(isActive: $presentDetail) {
                SingleDetailedFoodCell(food: food)
            } label: {
                EmptyView()
            }

        }
        .onTapGesture {
            presentDetail.toggle()
        }
       
    }
}

struct SimpleFoodCell_Previews: PreviewProvider {
    static var previews: some View {
        SimpleFoodCell(food: getSampleFood())
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
