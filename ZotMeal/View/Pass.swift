//
//  Pass.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/26/21.
//

import SwiftUI

struct Pass: View {
    
    @State private var dateString = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    Text(dateString)
                        .font(.title2)
                        .bold()
                    
                    Image("Pass")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Spacer()
                }
                .padding(.top, 16)
                .onAppear {
                    dateString = self.getDateString()
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color.red)
                            .font(.title2)
                    }

                }
            }
        }
        
    }
    
    func getDateString() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        return dateFormatter.string(from: date)
    }
}

struct Pass_Previews: PreviewProvider {
    static var previews: some View {
        Pass()
    }
}
