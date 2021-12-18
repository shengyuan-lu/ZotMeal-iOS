//
//  DetailedStationView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/14/21.
//

import SwiftUI

struct DetailedStationView: View {
    
    @State var station: Station
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: true) {
            
            ForEach(station.menu.sorted(by: { $0.items.count > $1.items.count }), id: \.self) { category in
                DetailedCategoryView(category: category)
                    .padding(.bottom, 8)
                
            }
            .padding([.horizontal, .bottom], 16)
            .padding(.top, 8)
        }
        .navigationTitle(station.station)
    }
}

struct DetailedStationView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedStationView(station: getSampleStation())
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
