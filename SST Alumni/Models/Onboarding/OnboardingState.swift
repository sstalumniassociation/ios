//
//  OnboardingState.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 22/9/23.
//

import Foundation
import SwiftUI

enum OnboardingState: Hashable {
    case welcome
    case security
    case announcements
    case loanVenues
    
    var color: Color {
        switch self {
        case .welcome: return .clear
        case .security: return .red
        case .announcements: return .blue
        case .loanVenues: return .gray
        }
    }
}
