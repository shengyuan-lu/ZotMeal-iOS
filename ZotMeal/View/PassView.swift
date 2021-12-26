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
            
            HStack(spacing: 12) {
                SelectionIndicator(isSelected: $passModel.isRestrictionAgreed)
                
                Text("I agree to all terms above")
                    .font(.body)
                    .bold()
            }
            
            GenericButtonWithLabelView(action: {
                
                self.showingSheet = true
                
            }, buttonText: "Show Zot Pass", systemName: "", bgColor: self.passModel.isRestrictionAgreed ? Color.blue : Color.secondary, textColor: Color.white, edgeInsets: EdgeInsets(top: 16, leading: 30, bottom: 16, trailing: 30))
                .disabled(!self.passModel.isRestrictionAgreed)

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
