//
//  CreditViewSection.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/29/21.
//

import SwiftUI

struct CreditViewSection: View {
    
    let title: String
    let text: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(title)
                .bold()
            
            Divider()
            
            Text (text)
            
        }
        .padding(10)
        .padding(.vertical, 8)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(UIColor(named: "dividerColor")!), style: StrokeStyle(lineWidth: 2))
        )
        .background(Color(UIColor(named: "categoryBG")!))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding([.horizontal, .top], 16)
    }
}

struct CreditViewSection_Previews: PreviewProvider {
    static var previews: some View {
        CreditViewSection(title: "About Me", text: "ABCD")
    }
}
