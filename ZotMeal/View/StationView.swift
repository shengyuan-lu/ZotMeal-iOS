//
//  StationView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/13/21.
//

import SwiftUI

struct StationView: View {
    
    @State var station: Station
    @State var action: Int? = 0
    @State var isExpanded: Bool = false
    
    let buttonText: String = "Detail"
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text(station.station)
                    .bold()
                    .font(.title2)
                
                Spacer()
                
                
                NavigationLink(destination: DetailedStationView(station: station), tag: 1, selection: $action) {
                    EmptyView()
                }
                
                GenericButtonWithLabelView(action: {
                    self.action = 1
                }, buttonText: buttonText, systemImageName: "square.fill.text.grid.1x2", bgColor: Color.yellow, textColor: Color.black)
                    .padding(.trailing, 8)
            }
            
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 16) {
                    ForEach(station.menu.sorted(by: { $0.items.count > $1.items.count }), id: \.self) { menu in
                        CategoryView(category: menu, isExpanded: $isExpanded)
                    }
                }
                .padding(.bottom, 16)
                
            }
        }
        
    }
}

struct StationView_Previews: PreviewProvider {
    static var previews: some View {
        StationView(station: getSampleStation())
    }
}
