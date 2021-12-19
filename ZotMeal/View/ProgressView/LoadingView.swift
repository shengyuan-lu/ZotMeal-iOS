//
//  LoadingView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/19/21.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        
        VStack(spacing: 40) {
            
            Text("Getting Menu From Server...")
                .font(.title2)
                .bold()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .scaleEffect(2)
            
        }
    }
    
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
