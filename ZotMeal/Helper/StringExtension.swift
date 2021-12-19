//
//  StringExtension.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/18/21.
//

import Foundation

extension String {

    func camelCaseToWords() -> String {

        return unicodeScalars.reduce("") {

            if CharacterSet.uppercaseLetters.contains($1) {

                return ($0 + " " + String($1))
            }
            else {

                return $0 + String($1)
            }
        }
    }
}

extension String {
    
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}
