//
//  SingleDetailedFoodCell.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 3/23/22.
//

import SwiftUI

struct SingleDetailedFoodCell: View {
    
    @State var food: Food
    
    var body: some View {

        ScrollView {
            DetailedFoodCell(food: food, isExpanded: true)
                .padding()
        }
        .navigationTitle("Detail")
        
    }
}

struct SingleDetailedFoodCell_Previews: PreviewProvider {
    static var previews: some View {
        SingleDetailedFoodCell(food: getSampleFood())
    }
}
