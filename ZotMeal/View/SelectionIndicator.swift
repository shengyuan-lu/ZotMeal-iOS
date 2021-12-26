//
//  SelectionIndicator.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/26/21.
//

import SwiftUI

struct SelectionIndicator: View {
    
    @Binding var isSelected: Bool
    
    var body: some View {
        
        if isSelected {
            
            ZStack {
                
                Circle()
                    .foregroundColor(.blue)
                
                Image(systemName: "checkmark")
                    .resizable()
                    .frame(width: 12, height: 12)
                    .foregroundColor(.white)
                
            }
            .frame(width: 24, height: 24)
            
        } else {
            Circle()
                .strokeBorder(Color.secondary, lineWidth: 1)
                .frame(width: 24, height: 24)
        }
    }
}

struct SelectionIndicator_Previews: PreviewProvider {
    static var previews: some View {
        SelectionIndicator(isSelected: Binding.constant(true))
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
        
        
        SelectionIndicator(isSelected: Binding.constant(false))
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
