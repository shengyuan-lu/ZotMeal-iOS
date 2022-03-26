//
//  ThemedView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 3/26/22.
//

import SwiftUI

struct ThemedView: View {
    
    @State var restaurant: Restaurant
    
    var body: some View {
        ScrollView(showsIndicators: true) {
            
            VStack(spacing: 0) {
                
                ForEach(restaurant.events.sorted(by: {$0.date < $1.date}), id: \.self) { event in
                    
                    
                    VStack(spacing: 0) {
                        
                        VStack(spacing: 0) {
                            HStack {
                                Spacer()
                                
                                Text(event.name)
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(Color.white)
                                    .padding(8)
                                
                                Spacer()
                            }
                            
                            Text(event.date)
                                .font(.footnote)
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(4)
                                .padding([.horizontal, .bottom], 4)
                        }
                        .background(Color.blue)
                        
                        
                        ThemedCell(startOrStop: "Start", timeInInt: event.service_start)
                            .padding(16)
                        
                        Divider()
                        
                        ThemedCell(startOrStop: "End", timeInInt: event.service_end)
                            .padding(16)
                        
                        
                    }
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(UIColor(named: "dividerColor")!), style: StrokeStyle(lineWidth: 2))
            )
            .background(Color(UIColor(named: "categoryBG")!))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
        }
        .padding(.horizontal, 16)
        .padding(.top, 4)
    }
}

struct ThemedView_Previews: PreviewProvider {
    static var previews: some View {
        ThemedView(restaurant: getEmptyRestaurant())
    }
}
