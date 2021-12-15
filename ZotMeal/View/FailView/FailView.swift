//
//  FailView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/15/21.
//

import SwiftUI

struct FailView: View {
    
    @EnvironmentObject var restaurantModel: RestaurantModel
    
    var body: some View {
        
        VStack(spacing: 16) {
            
            Text("Server returned invalid response.")
                .font(.title3)
                .bold()
            
            GenericButtonWithLabelView(action: {
                
                restaurantModel.reloadData()
                
            }, buttonText: "Try Again", systemImageName: "arrow.clockwise", bgColor: .blue, textColor: .white, edgeInsets: EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
            
            GenericButtonWithLabelView(action: {
                
                restaurantModel.loadDemoData()
                
            }, buttonText: "Load Demo Data (DEV)", systemImageName: "arrow.clockwise", bgColor: .green, textColor: .white, edgeInsets: EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
            
        }
        
    }
    
}

struct FailView_Previews: PreviewProvider {
    static var previews: some View {
        FailView()
            .environmentObject(RestaurantModel())
    }
}
