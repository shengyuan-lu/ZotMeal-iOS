//
//  CalendarView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/22/21.
//

import SwiftUI

struct CalendarView: View {
    
    @State var restaurant: Restaurant
    
    @State var index: Int
    
    let height: CGFloat = 140
    
    var body: some View {
        
        VStack {
            
            ZStack {
                RestaurantBannerImage(imageName: restaurant.restaurantName, height: height)
                
                VStack {
                    Spacer()
                    
                    VStack(spacing: 8) {
                        HStack {
                            Text(restaurant.restaurantName)
                                .bold()
                                .font(.title)
                                .foregroundColor(.white)
                                .shadow(color: Color.black, radius: 5, x: 5, y: 5)
                            
                            Spacer()
                        }
                        
                        ExDivider()
                        
                        HStack {
                            Text("Calendar Updated: " + restaurant.getMenuUpdateTimeInString())
                                .font(.body)
                                .foregroundColor(.white)
                                .shadow(color: Color.black, radius: 5, x: 5, y: 5)
                            
                            Spacer()
                        }
                        
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.black.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 0))
                    
                }
                
                
            }
            .frame(width: UIScreen.screenWidth, height: height, alignment: .center)
            
            Picker("", selection: $index) {
                Text("Themed Events").tag(0)
                Text("Schedule").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 16)
            .padding(.vertical, 4)
            .navigationTitle("Calendar")
            
            if index == 0 {
                if restaurant.events.count != 0 {
                    ThemedView(restaurant: restaurant)
                } else {
                    Text("No Themed Events In The Next 7 Days")
                        .bold()
                        .padding(.top, 16)
                }
                
            } else {
                ScheduleView(restaurant: restaurant)
            }
            
            
            Spacer()
            
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(restaurant: getEmptyRestaurant(), index: 1)
    }
}
