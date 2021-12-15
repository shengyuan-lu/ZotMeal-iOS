//
//  WebSearchView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/14/21.
//

import SwiftUI

struct WebSearchView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let url: URL
    
    var body: some View {
        
        NavigationView {
            WebView(url: url)
                .toolbar {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title)
                            .foregroundColor(.red)
                    }
                    
                }
                .edgesIgnoringSafeArea(.all)
                .navigationTitle(Text("Web Search"))
                .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    
}
