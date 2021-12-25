//
//  PassModel.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/25/21.
//

import Foundation

class PassModel: ObservableObject{
    
    @Published var isRestrictionOneAgreed: Bool = false
    @Published var isRestrictionTwoAgreed: Bool = false
    @Published var isRestrictionThreeAgreed: Bool = false
    
    
}
