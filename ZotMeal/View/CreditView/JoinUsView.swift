//
//  JoinUsView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/30/21.
//

import SwiftUI

struct JoinUsView: View {
    
    var body: some View {
        
        ScrollView(showsIndicators: true) {
            VStack(alignment: .leading, spacing: 20) {
                
                Text("Thinking About Joining Us?")
                    .bold()
                    .font(.title3)
                
                Text("ZotMeal is not possible without talented people at UC Irvine. It's time for you to make a dent in the universe. By joining our team, your work will have real users: your peers or even your professors. This feeling is insanely great. Stop putting projects you did in ICS 32 or 45C on your resume and show this to your employers.")
                
                Text("ZotMeal runs on a total ownership / responsibility model. That means your work belongs to you. What you write stays in your personal portfolio and your own GitHub. Giving credit is strict and necessary. This is very different from ICSSC or CTC which your work ultimately boosted your leader's resume. Also there's no title like 'president' or 'vp' or 'internal / external king of the world'. You are your own boss.")
                
                Text("Shengyuan hates rejecting people for no clear reason like some community college do in Palo Alto. Fit two criterias below will guarantee admission if there's a spot open. They are in 'OR' relationship.")
                
                Text("1. Be a direct admit as a freshmen to B.S. CS or B.S. CSE major at UC Irvine.")
                
                Text("2. Score 1480 on SAT or 34 on ACT or above as a high school student.")
                
                Text("3. Intern as a freshmen or sophomore at any tech companies. Intern as a junior at mainstream tech companies.")
                
                Text("4. Any personal project with 1,000 real users.")
                
                Text("5. Place 1st or 2nd or 3rd overall at any Pinnacle-eligible hackathons.")
                
                Spacer()
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .padding(.top, 10)
        }
        
    }
    
}

struct JoinUsView_Previews: PreviewProvider {
    static var previews: some View {
        JoinUsView()
    }
}
