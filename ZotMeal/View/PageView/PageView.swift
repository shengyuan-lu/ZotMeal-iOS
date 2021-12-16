//
//  PageView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/16/21.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    var pages: [Page]
    
    @Binding var currentPage: Int

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
    }
}
