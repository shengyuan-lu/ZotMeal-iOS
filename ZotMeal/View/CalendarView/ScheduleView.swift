//
//  ScheduleView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 3/26/22.
//

import SwiftUI

struct ScheduleView: View {
    
    @State var restaurant: Restaurant
    
    var body: some View {
        ScrollView(showsIndicators: true) {
            
            VStack(spacing: 0) {
                
                ForEach(["breakfast", "brunch", "lunch", "dinner"], id: \.self) { key in
                    
                    if let mealTypeSchedule = restaurant.schedule[key] {
                        
                        VStack(spacing: 0) {
                            
                            HStack {
                                Spacer()
                                
                                Text(key.capitalized)
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(Color.white)
                                    .padding(8)
                                
                                Spacer()
                            }
                            .background(Color.blue)
                            
                            ForEach(Array(mealTypeSchedule.keys).sorted(by: >), id: \.self) { k in
                                
                                if let mealTypeCellTime = mealTypeSchedule[k] {
                                    
                                    CalendarCell(startOrStop: k.capitalized, timeInInt: mealTypeCellTime)
                                        .padding(16)
                                    
                                    Divider()
                                }
                                
                            }
                            
                        }
                        
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

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView(restaurant: getEmptyRestaurant())
    }
}
