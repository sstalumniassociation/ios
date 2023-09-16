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
    
    func checkLocation() async -> LocationValidationState {
        await withCheckedContinuation { continuation in
            checkLocation { state in
                continuation.resume(with: .success(state))
            }
        }
    }
    
    func checkLocation(completion: @escaping ((LocationValidationState) -> Void)) {
        self.completionHandler = completion
        
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse:
            determineUserLocation()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        default:
            completion(.notAuthorized)
        }
    }
    
    private func determineUserLocation() {
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        guard locationManager.authorizationStatus == .authorizedWhenInUse else { return }
        
        determineUserLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
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
