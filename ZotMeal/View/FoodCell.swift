//
//  FoodCell.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/13/21.
//

import SwiftUI

struct FoodCell: View {
    
    @State var food: Food
    
    var body: some View {
        
        HStack {
            Text(food.name)
                .bold()
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
            Text(String(food.calories))
        }
       
    }
}

struct FoodCell_Previews: PreviewProvider {
    static var previews: some View {
        FoodCell(food: getSampleFood())
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
