//
//  StationView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/13/21.
//

import SwiftUI

struct StationView: View {
    
    @State var station: Station
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text(station.station)
                    .bold()
                    .font(.title2)
                
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(station.menu.sorted(by: { $0.items.count > $1.items.count }), id: \.self) { menu in
                        CategoryView(category: menu)
                    }
                }
                
            }
        }
    }
}

struct StationView_Previews: PreviewProvider {
    static var previews: some View {
        StationView(station: getSampleStation())
    }
}
