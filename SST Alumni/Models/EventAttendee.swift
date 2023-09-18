//
//  EventAttendee.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 17/9/23.
//

import Foundation

struct EventAttendee: Codable, Hashable, Identifiable {
    
    var id: String {
        admissionKey
    }
    
    var name: String
    var userId: String
    var admissionKey: String
}
