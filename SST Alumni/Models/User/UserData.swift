//
//  UserData.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import Foundation
import SwiftUI

struct UserData: Codable, Identifiable {
    /// Definitely unique
    var id: String
    
    /// From Firebase user ID
    var firebaseId: String?
    
    /// From CloudFlare
    var name: String
    var memberId: String
    var graduationYear: Int
    
    var memberType: MemberType
    
    static let sample = UserData(id: "qgdroptable", firebaseId: "2136245678", name: "Qin Guan", memberId: "OR2022029", graduationYear: 2020, memberType: .exco)
}
