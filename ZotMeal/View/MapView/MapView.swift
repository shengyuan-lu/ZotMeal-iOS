//
//  MapView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/19/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.6461, longitude: -117.8427), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    @State var resaurant: Restaurant
    
    var body: some View {
        
        Map(coordinateRegion: $region, interactionModes: [.pan, .zoom], showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: getAnnotations())
        {
            MapMarker(coordinate: $0.coordinate, tint: .blue)
            
        }
        .edgesIgnoringSafeArea([.trailing, .leading, .bottom])
    }
    
    
    
    func getAnnotations() -> [Location] {
        
        if resaurant.restaurantName == "Brandywine" {
            
            return [Location(name: "Brandywine", coordinate: CLLocationCoordinate2D(latitude: 33.64545359567486, longitude: -117.83935794252335))]
            
        } else if resaurant.restaurantName == "Anteatery" {
            
            return [Location(name: "Anteatery", coordinate: CLLocationCoordinate2D(latitude: 33.6509707747438, longitude: -117.8453661380031))]
            
        } else {
            return [Location(name: "Anteatery", coordinate: CLLocationCoordinate2D(latitude: 33.6461, longitude: -117.8427))]
        }
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(resaurant: getEmptyRestaurant())
    }
}
