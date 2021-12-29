//
//  CreditViewDetailCell.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/27/21.
//

import SwiftUI

struct CreditViewDetailCell: View {
    
    let genius: Genius
    
    var body: some View {
        
        VStack {
            
            PhotoView(genius: genius)
            
            VStack(alignment: .leading) {
                
                Text("About Me")
                    .bold()
                
                Text (genius.myDescription)
                
            }
            
        }
        
    }
    
}

struct CreditViewDetailCell_Previews: PreviewProvider {
    static var previews: some View {
        CreditViewDetailCell(genius: getSampleGenius())
            .previewDisplayName("Default preview")
        
    }
}
