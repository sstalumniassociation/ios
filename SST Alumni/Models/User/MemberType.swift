//
//  MemberType.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import Foundation
import SwiftUI

enum MemberType: Codable, Equatable {
    case exco
    case ordinary
    case associate
    case affiliate
    case revoked
    case unknown(String)
    
    var description: String {
        switch self {
        case .affiliate:
            return "Affliate Member"
        case .associate:
            return "Associate Member"
        case .ordinary:
            return "Ordinary Member"
        case .exco:
            return "SSTAA ExCo"
        case .revoked:
            return "Revoked"
        case .unknown(let value):
            return value
        }
    }
    
    var gradientColors: [Color] {
        switch self {
        case .exco: return [.red, .pink]
        case .ordinary: return [.orange, .yellow]
        case .associate: return [.blue, .teal]
        case .affiliate: return [.purple, .indigo]
        case .revoked: return [.black, .gray]
        case .unknown: return [.green]
        }
    }
    
    var accentColor: Color {
        gradientColors.first!
    }
    
    enum CodingKeys: CodingKey {
        case exco
        case ordinary
        case associate
        case affiliate
        case revoked
        case unknown
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.encodedValue)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        
        switch string {
        case "exco": self = .exco
        case "ordinary": self = .ordinary
        case "associate": self = .associate
        case "affiliate": self = .affiliate
        case "revoked": self = .revoked
        default: self = .unknown(string)
        }
    }
    
    var encodedValue: String {
        switch self {
        case .exco:
            return "exco"
        case .ordinary:
            return "ordinary"
        case .associate:
            return "associate"
        case .affiliate:
            return "affiliate"
        case .revoked:
            return "revoked"
        case .unknown(let value):
            return value
        }
    }
}
