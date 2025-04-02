//
//  Event.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 17/9/23.
//

import Foundation

struct Event: Codable, Identifiable, Hashable {
    var id: String
    var name: String
    var description: String
    var location: String
    var badgeImage: URL
    var startDateTime: Date
    var endDateTime: Date
    
    var attendees: [EventAttendee]
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case description
        case location
        case badgeImage
        case startDateTime
        case endDateTime
        case attendees
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
        self.location = try container.decode(String.self, forKey: .location)
        self.badgeImage = try container.decode(URL.self, forKey: .badgeImage)
        
        self.startDateTime = try Date(try container.decode(String.self,
                                                           forKey: .startDateTime), strategy: .iso8601)
        self.endDateTime = try Date(try container.decode(String.self,
                                                         forKey: .endDateTime), strategy: .iso8601)
        self.attendees = try container.decodeIfPresent([EventAttendee].self, forKey: .attendees) ?? []
    }
}
