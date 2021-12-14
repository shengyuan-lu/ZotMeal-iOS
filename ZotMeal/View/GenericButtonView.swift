//
//  ButtonView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/13/21.
//

import SwiftUI

struct GenericButtonView: View {
    
    let action: (() -> Void)
    let buttonText: String
    let bgColor: Color
    let textColor: Color
    
    var body: some View {
        
        Button {
            action()
        } label: {
            Text("View All")
                .font(.body)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .background(bgColor)
                .foregroundColor(textColor)
                .cornerRadius(8)
                .foregroundColor(.white)
        }
        
    }
    
}

struct GenericButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GenericButtonView(action: {
            // DO NOTHING
        }, buttonText: String("View All"), bgColor: Color.blue, textColor: Color.black)
            .padding()
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
