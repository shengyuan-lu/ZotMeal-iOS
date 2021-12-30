//
//  CreditView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/28/21.
//

import SwiftUI

struct CreditView: View {
    
    let genius: [Genius] = getAllGenius()
    
    @State private var isPresented = false
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack(spacing: 20) {
                
                ForEach(genius, id: \.id) { g in
                    
                    PhotoView(genius: g, widthFactor: ((UIScreen.screenWidth -  2 * 20) / UIScreen.screenWidth), showsNavigationButton: true)
                    
                }
                
            }
            .padding(.vertical, 16)
            
            Divider()
            
            Text("Special thanks to Max Liu (B.S. CSE '24), Jessie Yao (B.S. CS '23), and Susie Su (B.S. CSE '24) for their contributions to the original ZotMeal. We would also like to thank users like you who make all the work worth it.")
                .font(.footnote)
                .bold()
                .foregroundColor(.secondary)
                .padding([.horizontal, .bottom], 18)
            
        }
        .edgesIgnoringSafeArea([.bottom])
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    self.isPresented = true
                } label: {
                    Image(systemName: "person.crop.circle.fill.badge.plus")
                        .font(.title3)
                }

            }
        }
        .sheet(isPresented: $isPresented) {
            print("Modal dismissed. State now: \(self.isPresented)")
        } content: {
            JoinUsView()
        }

        
        
    }
    
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
