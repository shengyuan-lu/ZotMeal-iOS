//
//  ScheduleView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/22/21.
//

import SwiftUI

struct ScheduleView: View {
    
    @State var restaurant: Restaurant
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView(restaurant: getEmptyRestaurant())
    }
}
