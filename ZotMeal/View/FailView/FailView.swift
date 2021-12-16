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
            
            VStack(spacing: 10) {
                GenericButtonWithLabelView(action: {
                    
                    restaurantModel.reloadData()
                    
                }, buttonText: "Try Again", systemImageName: "arrow.clockwise", bgColor: .blue, textColor: .white, edgeInsets: EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
                
                
                Text("Debugging")
                
                
                GenericButtonWithLabelView(action: {
                    
                    restaurantModel.loadLocalDemoData()
                    
                }, buttonText: "Load Local Demo Data", systemImageName: "arrow.clockwise", bgColor: .green, textColor: .white, edgeInsets: EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
                
                GenericButtonWithLabelView(action: {
                    
                    restaurantModel.loadRemoteDemoData()
                    
                }, buttonText: "Load Remote Demo Data", systemImageName: "arrow.clockwise", bgColor: .green, textColor: .white, edgeInsets: EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
            }
            .fixedSize(horizontal: true, vertical: false)
        }
        
    }
    
}

struct FailView_Previews: PreviewProvider {
    static var previews: some View {
        FailView()
            .environmentObject(RestaurantModel())
    }
}
