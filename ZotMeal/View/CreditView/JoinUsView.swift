//
//  JoinUsView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/30/21.
//

import SwiftUI

struct JoinUsView: View {
    
    var body: some View {
        
        NavigationView {
            
            ScrollView(showsIndicators: true) {
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Stop putting projects you did in ICS 32 or 45C on your resume. It's time to show something real to your employers. ZotMeal is not possible without crazily talented people at UC Irvine. Do you want to make a dent in the universe? By joining our team, your work will have real users: your peers, staffs, or even professors. This feeling is insanely great.")
                    
                    Text("ZotMeal runs on a total ownership/responsibility model. That means your work belongs to you. What you write stays in your portfolio and your own GitHub. This is very different from ICSSC or CTC which your work ultimately boosted the club leader's resume. Also, there's no title like 'president' or 'vp' or 'manager'. We are a flat organization, and we take pride in giving everyone credit and a platform to show their skills.")
                    
                    
                    Spacer()
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding([.horizontal, .bottom])
                .padding(.top, 8)
                
            }
            .navigationTitle("Join Us")
        }
        
        
    }
    
}

struct JoinUsView_Previews: PreviewProvider {
    static var previews: some View {
        JoinUsView()
    }
}
