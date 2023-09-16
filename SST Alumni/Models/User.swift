//
//  User.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import Foundation

struct User {
    var name: String
    var userId: String
    var graduationYear: String
    var memberType: MemberType
    
    enum MemberType {
        case associateMember
        case member
        case exco
        
        var description: String {
            switch self {
            case .associateMember:
                return "Associate Member"
            case .member:
                return "Member"
            case .exco:
                return "ExCo"
            }
        }
    }
    
    static let sample = User(name: "Qin Guan", userId: "OR2022029", graduationYear: "2020", memberType: .associateMember)
}