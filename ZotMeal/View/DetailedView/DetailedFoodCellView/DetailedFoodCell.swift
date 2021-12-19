//
//  DetailedFoodCel.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/14/21.
//

import SwiftUI

struct DetailedFoodCell: View {
    
    @State var food: Food
    @State var isExpanded: Bool = false
    
    @State private var showingWebSearch = false
    
    var body: some View {
        
        VStack(spacing: 8) {
            
            HStack {
                VStack(spacing: 4) {
                    
                    HStack {
                        Text(food.name)
                            .bold()
                            .font(.title2)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text(String(food.getNutritionCalorieValue(key: .calories)) + " Calories")
                        
                        Spacer()
                    }
                }
                
                GenericButtonWithoutLabel(action: {
                    self.showingWebSearch.toggle()
                }, systemName: "magnifyingglass.circle.fill", imageColor: Color.blue)
            }
            .sheet(isPresented: $showingWebSearch) {
                WebSearchView(url: getURLfromName(name: food.name))
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 4) {
                
                HStack {
                    Text("Description")
                        .bold()
                    
                    Spacer()
                }
                
                
                Text(self.getFoodDescription())
                    .font(.callout)
                    .fixedSize(horizontal: false, vertical: true)
                
                
            }
            
            if hasNutritionInfo() {
                
                Divider()
                
                HStack {
                    Text("Nutrition Info")
                        .bold()
                    
                    Spacer()
                    
                    ExpandButtonView(isExpanded: $isExpanded)
                }
            }
            
            if isExpanded {
                FoodNutritionView(food: food)
            }
            
            Divider()
        }
    }
    
    // FIXME: - This is not correct. Check all food nutrition info before deciding.
    
    func hasNutritionInfo() -> Bool {
        
        return true
        
    }
    
    
    func getFoodDescription() -> String {
        if food.description == "" || food.description == "N/A" {
            return "Not Available"
        } else {
            return food.description
        }
    }
    
    
    func getURLfromName(name: String) -> URL{
        let url = Constants.googleSearchURL + processName(name: name)
        return URL(string: url)!
    }
    
    
    func processName(name: String) -> String {
        var str = ""
        let postStr = removeSpecialCharsFromString(text: name)
        let strArray = postStr.split(separator: " ")
        
        for item in strArray {
            str.append(contentsOf: item)
            str.append("+")
        }
        
        let string = str.dropLast()
        
        return String(string)
    }
    
    
    func removeSpecialCharsFromString(text: String) -> String {
        let okayChars = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890")
        return text.filter { okayChars.contains($0) }
    }
}

struct DetailedFoodCell_Previews: PreviewProvider {
    static var previews: some View {
        DetailedFoodCell(food: getSampleFood())
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
