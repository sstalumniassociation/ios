//
//  SecurityAccessManager+LocalAuthentication.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import Foundation
import LocalAuthentication

extension SecurityAccessManager {
    func performBiometricsAuthentication() async -> BiometricAuthenticationState {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            do {
                let authentication = try await context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "")
                
                return authentication ? .approved : .biometricsFailure
            } catch {
                // Common failure reasons
                // - LAErrorUserFallback: if user tapped the fallback button
                // - LAErrorUserCancel: if user has tapped the Cancel button
                // - LAErrorSystemCancel: if some system event interrupted the evaluation (e.g. Home button pressed).
                return .biometricsFailure
            }
        } else {
            return .noBiometrics
        }
    }
}
