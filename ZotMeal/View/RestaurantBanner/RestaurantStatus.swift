//
//  RestaurantStatus.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/19/21.
//

import SwiftUI

struct RestaurantStatus: View {
    
    @State var restaurant: Restaurant
    @State var status: RestaurantOpenStatus = .loading
    
    var body: some View {
        
        HStack {
            
            HStack {
                
                Circle()
                    .foregroundColor(getStatusIndicatorColor())
                    .frame(width: 10, height: 10, alignment: .center)
                
                HStack(spacing: 6) {
                    
                    Text(status.rawValue)
                        .font(.body)
                        .bold()
                        .foregroundColor(.white)
                    
                    if status == .open {
                        Text("|")
                            .font(.body)
                            .foregroundColor(.white)
                        
                        Text(restaurant.mealType)
                            .font(.body)
                            .bold()
                            .foregroundColor(.white)
                        
                        if getPrice() > 0 {
                            Text("|")
                                .font(.body)
                                .foregroundColor(.white)
                            
                            Text("$" + String(getPrice()))
                                .font(.body)
                                .bold()
                                .foregroundColor(.white)
                        }
                    }
                   
                }
                .lineLimit(1)
                
            }
            .padding(.horizontal, 4)
            .onAppear {
                updateStatus()
            }

            
            Spacer()
            
            HStack(spacing: 12) {
                
                NavigationLink {
                    CalendarView(restaurant: restaurant, index: 1)
                        .navigationBarTitleDisplayMode(.inline)
                    
                } label: {
                    Image(systemName: "calendar")
                        .shadow(color: Color.black, radius: 3, x: 3, y: 3)
                        .foregroundColor(.white)
                        .font(.title2)
                }
                
                
                NavigationLink {
                    PricingView(restaurant: restaurant)
                        .navigationTitle("Pricing")
                        .navigationBarTitleDisplayMode(.inline)
                    
                } label: {
                    Image(systemName: "dollarsign.circle.fill")
                        .shadow(color: Color.black, radius: 3, x: 3, y: 3)
                        .foregroundColor(.white)
                        .font(.title2)
                }
                
                
                NavigationLink {
                    MapView(restaurant: restaurant)
                        .navigationTitle("Map")
                        .navigationBarTitleDisplayMode(.inline)
                    
                } label: {
                    Image(systemName: "mappin.and.ellipse")
                        .shadow(color: Color.black, radius: 3, x: 3, y: 3)
                        .foregroundColor(.white)
                        .font(.title2)
                }
            }
            
        }
        .padding(8)
        .background(Color.black.opacity(0.6))
        .clipShape(RoundedRectangle(cornerRadius: 0))
        
    }
    
    
    func getPrice() -> Double {
        
        var price: Double = 0
        
        if let pr = restaurant.pricing[restaurant.mealType.lowercased()] {
            price = pr
        }
        
        return price
    }
    
    
    func updateStatus() -> Void {
        
        let timeInt = getCurrentTimeInInt()
        
        var openTime = 0
        var closeTime = 0
        
        if let breakfastTime =  restaurant.schedule["breakfast"] {
            if let breakfastOpenTime = breakfastTime["start"] {
                openTime = breakfastOpenTime
            }
        }
        
        if openTime == 9999 {
            status = .demo
            return
        }
        
        
        if let dinnerTime =  restaurant.schedule["dinner"] {
            if let dinnerCloseTime = dinnerTime["end"] {
                closeTime = dinnerCloseTime
            }
        }
        
        if openTime == 0 || closeTime == 0 {
            status = .notAvail
            return
        }
        
        if closeTime <= openTime {
            status = .notAvail
            return
        }
        
        if (openTime - timeInt) > 15 {
            status = .closed
        } else if (openTime - timeInt) <= 15 && (openTime - timeInt) >= 0 {
            status = .openSoon
        } else if (closeTime - timeInt) <= 15 && (closeTime - timeInt) >= 0 {
            status = .closeSoon
        } else if (closeTime - timeInt) > 15 {
            status = .open
        } else if (timeInt - closeTime) > 0 {
            status = .closed
        } else {
            status = .notAvail
        }
    }
    
    
    func getCurrentTimeInInt() -> Int {
        
        let date = Date()
        var calendar = Calendar.current
        
        if let timeZone = TimeZone(identifier: "PDT") {
           calendar.timeZone = timeZone
        }

        let hour = Int(calendar.component(.hour, from: date))
        let minute = Int(calendar.component(.minute, from: date))
        
        return hour * 100 + minute
    }
    
    
    func getStatusIndicatorColor() -> Color {
        
        switch status {
            
        case .loading:
            return Color.gray
            
        case .notAvail:
            return Color.gray
            
        case .open:
            return Color.green
            
        case .closed:
            return Color.red
        
        case .closeSoon:
            return Color.orange
            
        case .openSoon:
            return Color.yellow
            
        case .demo:
            return Color.blue
        }
    }
    
}


enum RestaurantOpenStatus: String {
    case open = "Open"
    case closed = "Closed Now"
    case closeSoon = "Close Soon"
    case openSoon = "Open Soon"
    case loading = "Loading..."
    case notAvail = "Status Not Available"
    case demo = "Demo Mode"
}

struct RestaurantStatus_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantStatus(restaurant: getEmptyRestaurant())
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Default Preview")
    }
}
