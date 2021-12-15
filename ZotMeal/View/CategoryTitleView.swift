//
//  CategoryTitleView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/13/21.
//

import SwiftUI

struct CategoryTitleView: View {
    
    @State var category: Category
    
    var body: some View {
        
        HStack {
            Spacer()
            
            Text(category.category + " (" + String(category.items.count) + ")")
                .foregroundColor(Color.white)
                .bold()
                .frame(alignment: .center)
                .padding(.vertical, 4)
            
            Spacer()
        }
        .background(Color.blue)
        
    }
}

struct CategoryTitleView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryTitleView(category: getSampleCategory())
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
