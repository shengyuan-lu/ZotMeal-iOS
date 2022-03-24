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
                .padding(24)
        }
        .background(Color(UIColor(named: "categoryBG")!))
        .edgesIgnoringSafeArea([.horizontal, .bottom])
        .navigationTitle("Detail")
        
    }
}

struct SingleDetailedFoodCell_Previews: PreviewProvider {
    static var previews: some View {
        SingleDetailedFoodCell(food: getSampleFood())
    }
}
