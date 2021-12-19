//
//  ExDivider.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/19/21.
//

import Foundation
import SwiftUI

struct ExDivider: View {
    let color: Color = Color(UIColor(named: "dividerColor")!)
    let width: CGFloat = 2
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: width)
            .edgesIgnoringSafeArea(.horizontal)
    }
}
