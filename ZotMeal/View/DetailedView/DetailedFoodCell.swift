//
//  DetailedFoodCel.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/14/21.
//

import SwiftUI

struct DetailedFoodCell: View {
    
    @State var food: Food
    @State var isExpanded: Bool = false
    
    var body: some View {
        
        VStack(spacing: 8) {
            
            HStack {
                VStack(spacing: 4) {
                    HStack {
                        Text(food.name)
                            .bold()
                            .font(.title2)
                        
                        Spacer()

                    }
                    
                    HStack {
                        Text(String(food.calories) + " Calories")
                        
                        Spacer()
                    }
                }
                
                GenericButtonWithoutLabel(action: {
                    
                }, systemName: "magnifyingglass.circle.fill", imageColor: Color.blue)
            }
            
            Divider()
            
            VStack(spacing: 4) {
                
                HStack {
                    Text("Description")
                        .bold()
                    
                    Spacer()
                }
                
                HStack {
                    Text(food.description)
                        .font(.callout)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                }
            }
            
            Divider()
            
            HStack {
                Text("Nutrition Info")
                    .bold()
                
                Spacer()
                
                ExpandButtonView(isExpanded: $isExpanded)
            }
            
            if isExpanded {
                FoodSpecView(food: food)
            }
            
            Divider()
            
        }
    }
}

struct DetailedFoodCell_Previews: PreviewProvider {
    static var previews: some View {
        DetailedFoodCell(food: getSampleFood())
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
