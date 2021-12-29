//
//  PhotoView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/28/21.
//

import SwiftUI

struct PhotoView: View {
    
    let genius: Genius
    
    var body: some View {
        
        
        ZStack {
            
            Image(genius.photoName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.screenWidth * 0.9, height: 300)
                .clipped()
            
            
            VStack {
                PositionView(genius: genius)
                
                Spacer()
                
                NameMajorView(genius: genius)
            }
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .frame(width: UIScreen.screenWidth * 0.9, height: 300)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(UIColor(named: "dividerColor")!), style: StrokeStyle(lineWidth: 0.5))
        )
        
    }
    
}



struct PhotoView_Previews: PreviewProvider {
    
    static var previews: some View {
        PhotoView(genius: getSampleGenius())
            .previewDisplayName("Default preview")
    }
    
}
