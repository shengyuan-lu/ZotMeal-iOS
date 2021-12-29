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
        
        ScrollView {
            
            VStack(spacing: 0) {
                
                PhotoView(genius: genius, widthFactor: ((UIScreen.screenWidth -  2 * 16) / UIScreen.screenWidth), showsNavigationButton: false)
                
                CreditViewSection(title: "About Me", text: genius.myDescription)
                
                CreditViewSection(title: "My Role in ZotMeal", text: genius.roleDescription)
                
                VStack(alignment: .leading) {
                    
                    Text("Experiences / Awards")
                        .bold()
                    
                    Divider()
                    
                    ForEach(genius.experience, id: \.id) { exp in
                        
                        HStack {
                            
                            Text(exp.name)
                            
                            Spacer()
                            
                            Text(String(exp.year))
                            
                        }
                    }
                    
                    ForEach(genius.awards, id: \.id) { exp in
                        
                        HStack {
                            
                            Text(exp.name)
                            
                            Spacer()
                            
                            Text(String(exp.year))
                            
                        }
                    }
                    
                }
                .padding(12)
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
        
        
    }
    
}

struct CreditViewDetailCell_Previews: PreviewProvider {
    static var previews: some View {
        CreditViewDetailCell(genius: getSampleGenius())
            .previewDisplayName("Default preview")
        
    }
}
