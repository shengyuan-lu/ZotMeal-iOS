//
//  ThemedNoticeView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 3/26/22.
//

import SwiftUI

struct ThemedNoticeView: View {
    
    let restaurant: Restaurant
    
    @State var isActive: Bool = false
    
    var body: some View {
        
        NavigationLink(isActive: $isActive) {
            CalendarView(restaurant: restaurant, index: 0)
        } label: {
            HStack() {
                
                Image(systemName: "star.fill")
                    .font(.body)
                
                Text("Event: " + getEventName())
                    .font(.body)
                    .bold()
                
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .onTapGesture {
                isActive.toggle()
            }
        }
        
    }
    
    func getEventName() -> String {
        
        for event in restaurant.events {
            if restaurant.dateString == event.date {
                return event.name
            }
        }
        
        return ""
    }
}

struct ThemedNoticeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemedNoticeView(restaurant: getEmptyRestaurant())
    }
}
