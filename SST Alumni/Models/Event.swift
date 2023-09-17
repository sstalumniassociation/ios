//
//  Event.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 17/9/23.
//

import Foundation

struct Event: Codable, Identifiable {
    var id: String
    var name: String
    var description: String
    var location: String
    var badgeImage: URL
    var startDateTime: Date
    var endDateTime: Date
}
