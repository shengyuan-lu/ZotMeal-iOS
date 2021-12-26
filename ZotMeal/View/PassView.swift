//
//  PassView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/25/21.
//

import SwiftUI

struct PassView: View {
    
    @StateObject var passModel: PassModel = PassModel()
    
    @State private var showingSheet = false
    
    var body: some View {
        
        VStack(spacing: 24) {
            
            Divider()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("1. I am fully compliant with all UC Irvine vaccine, mass Covid-19 testing, and other health regulations")
                    
                    Text("2. I do not display any symptoms of Covid-19 (fever or chills, cough, shortness of breath, fatigue, etc.) in the past 14 days.")
                    
                    Text("3. I haven't contacted with anyone diagnosed with Covid-19 in the past 14 days.")
                    
                    Text("4. I have completed my daily symptoms check and received a green Zot Pass today.")
                    
                    Text("5. I understand that this feature is experimental, and its only intent is to provide convenience to students to avoid long loading time on Service Now app or sorting through the entire email inbox.")
                    
                    Text("6. I take full responsibility if I use this feature without full compliance.")
                    
                }
                .padding(.horizontal)
            }
            
            
            Spacer()
            
            Divider()
            
            HStack(spacing: 12) {
                SelectionIndicator(isSelected: $passModel.isRestrictionAgreed)
                
                Text("I agree to all statements above")
                    .font(.body)
                    .bold()
            }
            
            GenericButtonWithLabelView(action: {
                
                self.showingSheet = true
                
            }, buttonText: "Show Zot Pass", systemName: "", bgColor: self.passModel.isRestrictionAgreed ? Color.blue : Color.secondary, textColor: Color.white, edgeInsets: EdgeInsets(top: 16, leading: 30, bottom: 16, trailing: 30))
                .disabled(!self.passModel.isRestrictionAgreed)
                .padding(.bottom, 8)

        }
        .sheet(isPresented: $showingSheet) {
            Pass()
        }
        
    }
    
}

struct PassView_Previews: PreviewProvider {
    static var previews: some View {
        PassView()
    }
}
