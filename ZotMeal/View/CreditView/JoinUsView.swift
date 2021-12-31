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
                    
                    Text("Stop putting projects you did in ICS 32 or 45C on your resume: time to show something real to your employers. ZotMeal is not possible without crazily talented people at UC Irvine. It's time for you to make a dent in the universe. By joining our team, your work will have real users: your peers, staffs, or even professors. This feeling is insanely great.")
                    
                    Text("ZotMeal runs on a total ownership / responsibility model. That means your work belongs to you. What you write stays in your personal portfolio and your own GitHub. Giving credit is strict and necessary. This is very different from ICSSC or CTC which your work ultimately boosted the club leader's resume. Also there's no title like 'president' or 'vp' or 'internal / external king of the world'. We are a flat organization.")
                    
                    Text("Shengyuan hates getting rejected for no clear reason like 'some college' does to their applicants in Palo Alto. For the iOS team, if there's a spot open, fit three criterias below will guarantee admission. In addition, any apps published on Apple App Store written in Swift will guarantee admission.")
                    
                    Text("1. Be a direct admit as a freshmen to B.S. CS or B.S. CSE major at UC Irvine.")
                    
                    Text("2. Score 1480 on SAT or 34 on ACT or above as a high school student.")
                    
                    Text("3. Intern as a freshmen or sophomore at any tech companies with more than 50 employees.")
                    
                    Text("4. Any personal projects with 1000 real users. This does't have to be in tech. Your Tiktok has 1,000 fans? Let's go!")
                    
                    Text("5. Place 3rd or above in any category at any Pinnacle-eligible hackathons, or place 3rd or above overall at any university-level hackathons hosted in North America.")
                    
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
