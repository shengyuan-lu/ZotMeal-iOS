//
//  FailView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/15/21.
//

import SwiftUI

struct FailView: View {
    
    @EnvironmentObject var restaurantModel: RestaurantModel
    
    @State var isLoading: Bool = false
    
    var body: some View {
        
        if isLoading {
            
            LoadingView()
            
        } else {
            
            VStack(spacing: 16) {
                
                Text("Server returned invalid response.")
                    .font(.title3)
                    .bold()
                
                VStack(spacing: 10) {
                    
                    // Try again
                    GenericButtonWithLabelView(action: {
                        
                        startLoading()
                        restaurantModel.loadRemoteRealData()
                        
                    }, buttonText: "Try Again", systemName: "arrow.clockwise", bgColor: .blue, textColor: .white, edgeInsets: EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
                    
                    VStack {
                        Text("Debugging Use Only")
                        
                        // Load Local Demo
                        GenericButtonWithLabelView(action: {
                            
                            startLoading()
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                restaurantModel.loadLocalDemoData()
                            }
                            
                        }, buttonText: "Load Local Demo JSON", systemName: "arrow.clockwise", bgColor: .green, textColor: .white, edgeInsets: EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
                        
                        
                        // Load Remote Demo
                        GenericButtonWithLabelView(action: {
                            
                            startLoading()
                            restaurantModel.loadRemoteDemoData()
                            
                        }, buttonText: "Load Remote Demo JSON", systemName: "arrow.clockwise", bgColor: .green, textColor: .white, edgeInsets: EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
                    }
                    .padding(.top, 40)
                    
                }
                .fixedSize(horizontal: true, vertical: false)
            }
            
        }
    }
    
    func startLoading() {
        
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isLoading = false
        }
    }
    
}

struct FailView_Previews: PreviewProvider {
    static var previews: some View {
        FailView()
            .environmentObject(RestaurantModel())
    }
}
