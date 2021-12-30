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
                    
                    PhotoView(genius: g, widthFactor: ((UIScreen.screenWidth -  2 * 20) / UIScreen.screenWidth), showsNavigationButton: true)
                    
                }
                
            }
            .padding(.vertical, 16)
            
            Divider()
            
            Text("Special thanks to Max Liu (B.S. CSE '24), Jessie Yao (B.S. CS '23), and Susie Su (B.S. CSE '24) for their contributions to the original ZotMeal.")
                .font(.footnote)
                .bold()
                .foregroundColor(.secondary)
                .padding([.horizontal, .bottom], 18)
            
        }
        .edgesIgnoringSafeArea([.bottom])
        
    }
    
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
