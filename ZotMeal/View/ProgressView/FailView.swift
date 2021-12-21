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
    
    let isDebugModeON = false
    
    var body: some View {
        
        if isLoading {
            
            LoadingView()
            
        } else {
            
            VStack(spacing: 16) {
                
                Text("ZotMeal Can't Load Menu")
                    .font(.title2)
                    .bold()
                
                VStack(alignment: .leading) {
                    
                    Divider()
                    
                    Text("Possibility 1:")
                        .font(.footnote)
                        .bold()
                    
                    Text("Network not available (go check it!)")
                        .font(.footnote)
                    
                    Divider()
                    
                    Text("Possibility 2:")
                        .font(.footnote)
                        .bold()
                    
                    Text("Our server decided to turn into a potato")
                        .font(.footnote)
                    
                    Divider()
                    
                    Text("Possibility 3:")
                        .font(.footnote)
                        .bold()
                    
                    Text("Sleep-deprived Shengyuan messed up some code")
                        .font(.footnote)
                    
                    Divider()
                }
                .padding([.horizontal, .bottom])

                
                VStack(spacing: 10) {
                    
                    // Try again
                    GenericButtonWithLabelView(action: {
                        
                        startLoading()
                        
                        // FIXME: - change it to real data
                        restaurantModel.loadLocalDemoData()
                        
                    }, buttonText: "Try Again", systemName: "arrow.clockwise", bgColor: .blue, textColor: .white, edgeInsets: EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
                    
                    if isDebugModeON {
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
                    
                }
                .fixedSize(horizontal: true, vertical: false)
            }
            
        }
    }
    
    func startLoading() {
        
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
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
