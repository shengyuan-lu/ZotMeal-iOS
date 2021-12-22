//
//  PricingListCell.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/21/21.
//

import SwiftUI

struct PricingListCell: View {
    
    let item: String
    let price: Double
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text(item)
                    .font(.title3)
                    .bold()
                
                Spacer()
                
                Text("$" + String(price))
                    .font(.title3)
                    .bold()
                    .foregroundColor(.green)
            }
            
            Divider()
        }
        
    }
    
}

struct PricingListCell_Previews: PreviewProvider {
    static var previews: some View {
        PricingListCell(item: "Breakfast", price: 13.95)
    }
}
