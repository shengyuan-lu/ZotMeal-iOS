//
//  ScheduleView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/22/21.
//

import SwiftUI

struct ScheduleView: View {
    
    @State var restaurant: Restaurant
    
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
                            Text("Schedule Updated: " + restaurant.getMenuUpdateTimeInString())
                                .font(.body)
                                .foregroundColor(.white)
                                .shadow(color: Color.black, radius: 5, x: 5, y: 5)
                            
                            Spacer()
                        }
                        
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Color.black.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 0))
                    
                }
                
                
            }
            .frame(width: UIScreen.screenWidth, height: height, alignment: .center)
            
            ScrollView {
                
                VStack(spacing: 16) {
                    
                    ForEach(["breakfast", "brunch", "lunch", "dinner"], id: \.self) { key in
                        
                        if let mealTypeSchedule = restaurant.schedule[key] {
                            
                            VStack(spacing: 8) {
                                
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
                                        
                                        ScheduleCell(startOrStop: k.capitalized, timeInInt: mealTypeCellTime)
                                            .padding(8)
                                        
                                        Divider()
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
                        
                    }
                    .padding(.horizontal, 12)
                    
                }
                
            }
            
            Spacer()
            
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView(restaurant: getEmptyRestaurant())
    }
}
