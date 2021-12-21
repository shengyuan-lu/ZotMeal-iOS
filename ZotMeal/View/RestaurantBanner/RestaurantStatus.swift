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
            
            Circle()
                .foregroundColor(getStatusIndicatorColor())
                .frame(width: 10, height: 10, alignment: .center)
            
            HStack(spacing: 6) {
                Text(status.rawValue)
                    .font(.body)
                    .bold()
                    .foregroundColor(.white)
                
                if status != .loading && status != .notAvail {
                    Text("|")
                        .font(.body)
                        .foregroundColor(.white)
                    
                    Text(restaurant.mealType)
                        .font(.body)
                        .bold()
                        .foregroundColor(.white)
                }
               
            }
            
        }
        .padding(.horizontal, 4)
        .onAppear {
            updateStatus()
        }
        
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
        
        if (openTime - timeInt) >= 15 {
            status = .closed
        } else if (openTime - timeInt) <= 15 && (openTime - timeInt) >= 0 {
            status = .openSoon
        } else if (closeTime - timeInt) >= 15 {
            status = .open
        } else if (closeTime - timeInt) <= 15 && (closeTime - timeInt) >= 0 {
            status = .closeSoon
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
            
        }
    }
    
    
}

enum RestaurantOpenStatus: String {
    case open = "Open Now"
    case closed = "Closed Now"
    case closeSoon = "Close Soon"
    case openSoon = "Open Soon"
    case loading = "Loading..."
    case notAvail = "Not Available"
}

struct RestaurantStatus_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantStatus(restaurant: getEmptyRestaurant())
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Default Preview")
    }
}
