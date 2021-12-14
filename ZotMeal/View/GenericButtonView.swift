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
    
    var body: some View {
        
        Button {
            action()
        } label: {
            Text("View All")
                .font(.body)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .background(Color(UIColor.systemBlue))
                .cornerRadius(8)
                .foregroundColor(.white)
        }
        
    }
    
}

struct GenericButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GenericButtonView(action: {
            // DO NOTHING
        }, buttonText: String("View All"))
            .padding()
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
