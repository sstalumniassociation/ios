//
//  UserData.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import Foundation
import SwiftUI

struct UserData: Codable {
    /// From Firebase user ID
    var id: String?
    
    /// From CloudFlare
    var name: String
    var memberId: String
    var graduationYear: String
    
    var memberType: MemberType
    
    static let sample = UserData(id: "2136245678", name: "Qin Guan", memberId: "OR2022029", graduationYear: "2020", memberType: .exco)
}
