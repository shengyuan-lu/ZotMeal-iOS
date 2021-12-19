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
    @State var detailMenuTrigger: Int? = 0
    
    let buttonText: String = "View All"
    
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
                }, buttonText: buttonText, systemName: "", bgColor: Color.yellow, textColor: Color.black, edgeInsets: EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                    .padding(.horizontal, 8)
                    .padding(.trailing, 4)
            }
            
            
            ScrollView(.horizontal, showsIndicators: true) {
                
                HStack(spacing: 12) {
                    ForEach(station.menu.sorted(by: { $0.items.count > $1.items.count }), id: \.self) { menu in
                        
                        CategoryView(category: menu, isExpanded: $isExpanded)
                            .onTapGesture {
                                detailMenuTrigger = 1
                            }
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
