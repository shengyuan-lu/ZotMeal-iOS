//
//  PositionView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/28/21.
//

import SwiftUI

struct PositionView: View {
    
    let genius: Genius
    
    var body: some View {
        
        HStack {
            Text(genius.position)
                .font(.footnote)
                .foregroundColor(.white)
                .bold()
                .padding(8)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer()
        }
        .padding(8)
    }
}

struct PositionView_Previews: PreviewProvider {
    static var previews: some View {
        PositionView(genius: getSampleGenius())
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
