//
//  Location.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/19/21.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
