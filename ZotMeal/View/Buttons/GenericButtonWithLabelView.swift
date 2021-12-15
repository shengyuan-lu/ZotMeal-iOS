//
//  ButtonView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/13/21.
//

import SwiftUI

struct GenericButtonWithLabelView: View {
    
    let action: (() -> Void)
    let buttonText: String
    let systemImageName: String
    let bgColor: Color
    let textColor: Color
    
    var body: some View {
        
        Button {
            action()
            
        } label: {
            
            HStack {
                if systemImageName != "" {
                    Image(systemName: systemImageName)
                }
                
                Text(buttonText)
                    .font(.body)
                    
            }
            .foregroundColor(textColor)
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            .background(bgColor)
            .cornerRadius(8)
        }
    }
}

struct GenericButtonWithLabelView_Previews: PreviewProvider {
    static var previews: some View {
        GenericButtonWithLabelView(action: {
            // DO NOTHING FOR PREVIEW
        }, buttonText: String("View All"), systemImageName: "", bgColor: Color.blue, textColor: Color.black)
            .padding()
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
