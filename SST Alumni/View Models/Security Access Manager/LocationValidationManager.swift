//
//  LocationValidationManager.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 17/9/23.
//

import Foundation
import CoreLocation

class LocationValidationManager: NSObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    private var completionHandler: ((LocationValidationState) -> Void)?
    
    var didOutputValue = false
    
    func checkLocation() async -> LocationValidationState {
        await withCheckedContinuation { continuation in
            checkLocation { state in
                continuation.resume(with: .success(state))
            }
        }
    }
    
    func checkLocation(completion: @escaping ((LocationValidationState) -> Void)) {
        self.completionHandler = completion
        
        locationManager.delegate = self
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            completion(.notAuthorized)
        default: break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    private func determineUserLocation() {
        locationManager.requestLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        guard locationManager.authorizationStatus == .authorizedWhenInUse else { return }
        
        determineUserLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first, !didOutputValue else { return }
        didOutputValue = true
        
        let region = CLCircularRegion(center: .sst, radius: 1000, identifier: "TargetRegion")
        
        if region.contains(location.coordinate) {
            // User is within 1km radius of the target location
            self.completionHandler?(.approved)
        } else {
            // User is not within 1km radius of the target location
            self.completionHandler?(.notInRange)
        }
    }
}
