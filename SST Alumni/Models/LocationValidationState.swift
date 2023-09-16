//
//  LocationValidationState.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 17/9/23.
//

import Foundation

enum LocationValidationState {
    case notAuthorized
    case notInRange
    case approved
    
    var description: String {
        switch self {
        case .notAuthorized: return "Enable location access in Settings."
        case .notInRange: return "You must be on campus to access this feature."
        case .approved: return "Approved"
        }
    }
}
