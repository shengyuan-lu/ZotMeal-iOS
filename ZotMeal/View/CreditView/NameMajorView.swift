//
//  NameMajorView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/28/21.
//

import SwiftUI

struct NameMajorView: View {
    
    let genius: Genius
    
    let showsNavigationButton: Bool
    
    var body: some View {
        
        HStack {
            
            VStack(alignment: .leading, spacing: 4) {
                
                Text(genius.name)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                
                Text(genius.major + " (" + String(genius.year) + ")")
                    .foregroundColor(.white)
                
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 12)
            
            Spacer()
            
            if showsNavigationButton {
                NavigationLink {
                    
                    CreditViewDetailCell(genius: genius)
                        .navigationBarTitle("Genius")
                    
                } label: {
                    Image(systemName: "chevron.forward.circle.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .padding(8)
                        .padding(.trailing, 4)
                }
            }
        }
        .background(Color.black.opacity(0.6))
    }
}

struct NameMajorView_Previews: PreviewProvider {
    static var previews: some View {
        NameMajorView(genius: getSampleGenius(), showsNavigationButton: true)
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
