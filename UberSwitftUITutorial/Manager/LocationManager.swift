//
//  LocationManager.swift
//  UberSwitftUITutorial
//
//  Created by kiet on 15/09/2023.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject{
    private let locationManager = CLLocationManager()// an instance of the CLLocationManager class.
    override init() {
        // request the user permission, grab the location one time and the MapView will handle the rest
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}
extension LocationManager: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard !locations.isEmpty else {return}
        locationManager.stopUpdatingLocation()// leave the location update to MapView
    }
}
