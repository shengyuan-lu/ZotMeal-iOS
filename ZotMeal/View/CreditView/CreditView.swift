//
//  CreditView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/28/21.
//

import SwiftUI

struct CreditView: View {
    
    let genius: [Genius] = getAllGenius()
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack(spacing: 20) {
                
                ForEach(genius, id: \.id) { g in
                    
                    PhotoView(genius: g)
                    
                }
                
            }
            .padding(.vertical, 8)
            
        }
        
    }
    
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
