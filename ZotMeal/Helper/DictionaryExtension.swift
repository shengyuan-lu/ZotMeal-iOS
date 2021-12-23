//
//  DictionaryExtension.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/22/21.
//

import Foundation

extension Dictionary where Value: Comparable {
    
    var valueKeySorted: [(Key, Value)] {
        return sorted{ if $0.value != $1.value { return $0.value > $1.value } else { return String(describing: $0.key) < String(describing: $1.key) } }
    }
    
}
