//
//  LocationManager.swift
//  ZooGame
//
//  Created by Nikolas Šťastný on 07/01/2023.
//

import Foundation
import CoreLocation
import MapKit

class LocationManager: NSObject, ObservableObject {
    let locationManager = CLLocationManager()
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 49.23109, longitude: 16.53312),
                                               span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
    @Published var location: CLLocation?
    @Published var latitude: Double = 0.0
    @Published var longitude: Double = 0.0


    override init() {
        super.init()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        //self.locationManager.requestLocation()
        self.locationManager.startUpdatingLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
        self.latitude = location.coordinate.latitude
        self.longitude = location.coordinate.longitude
    }
    
    
}

extension LocationManager: CLLocationManagerDelegate{
    
}

