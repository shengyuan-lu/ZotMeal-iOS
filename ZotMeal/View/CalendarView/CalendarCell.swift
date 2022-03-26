//
//  CalendarCell.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/22/21.
//

import SwiftUI

struct CalendarCell: View {
    
    let startOrStop: String
    let timeInInt: Int
    
    var body: some View {
        
        HStack {
            
            Text(startOrStop)
                .bold()
            
            Spacer()
            
            Text(getTimeInString())
                .bold()
            
        }

    }
    
    func getTimeInString() -> String {
        
        if !(self.timeInInt >= 0 && self.timeInInt < 2400) {
            return ""
        }
        
        let hour: Int = Int(self.timeInInt / 100)
        let minute: Int = self.timeInInt - (hour * 100)
        var minuteInString = String(minute)
        
        if minuteInString.count == 1 {
            minuteInString = "0" + minuteInString
        }
        
        if hour < 12 {
            return String(hour) + ":" + minuteInString + " am"
            
        } else {
            
            if hour == 12 {
                return String(hour) + ":" + minuteInString + " pm"
                
            } else {
                return String(hour - 12) + ":" + minuteInString + " pm"
                
            }
        }
    }
    
    
}

struct CalendarCell_Previews: PreviewProvider {
    
    static var previews: some View {
        CalendarCell(startOrStop: "Start", timeInInt: 1200)
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
