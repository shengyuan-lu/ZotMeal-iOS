//
//  MapView.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/19/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.6461, longitude: -117.8427), span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008))
    
    @State var restaurant: Restaurant
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            
            ZStack {
                Map(coordinateRegion: $region, interactionModes: [.pan], showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: [getAnnotations()]) {
                    
                    MapMarker(coordinate: $0.coordinate, tint: .red)
                    
                }
                
                VStack {
                    
                    VStack(spacing: 0) {
                        
                        HStack {
                            
                            Spacer()
                            
                            Text(restaurant.restaurantName + " Location")
                                .bold()
                                .font(.title2)
                                .foregroundColor(.white)
                                .shadow(color: Color.black, radius: 5, x: 5, y: 5)
                            
                            Spacer()
                        }
                        
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Color.black.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 0))
                    
                    Spacer()
                    
                    GenericButtonWithLabelView(action: {
                        
                        let url = URL(string: "maps://?saddr=&daddr=\(getAnnotations().coordinate.latitude),\(getAnnotations().coordinate.longitude)")
                        
                        if UIApplication.shared.canOpenURL(url!) {
                              UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                        }
                        
                        
                    }, buttonText: "Open in Apple Maps", systemName: "map.fill", bgColor: Color.blue, textColor: Color.white, edgeInsets: EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20))
                        .padding(.bottom, 60)
                        .shadow(color: Color.black.opacity(0.4), radius: 5, x: 1, y: 1)
                }
            }
            .edgesIgnoringSafeArea([.horizontal, .bottom])

        }
        
    }

    
    func getAnnotations() -> Location {
        
        if restaurant.restaurantName == "Brandywine" {
            
            return Location(name: "Brandywine", coordinate: CLLocationCoordinate2D(latitude: 33.64545359567486, longitude: -117.83935794252335))
            
        } else if restaurant.restaurantName == "Anteatery" {
            
            return Location(name: "Anteatery", coordinate: CLLocationCoordinate2D(latitude: 33.6509707747438, longitude: -117.8453661380031))
            
        } else {
            return Location(name: "Sample", coordinate: CLLocationCoordinate2D(latitude: 33.6461, longitude: -117.8427))
        }
    }
    
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(restaurant: getEmptyRestaurant())
    }
}
