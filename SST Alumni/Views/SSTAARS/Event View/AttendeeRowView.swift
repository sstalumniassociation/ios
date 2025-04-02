//
//  AttendeeRowView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 18/9/23.
//

import SwiftUI

struct AttendeeRowView: View {
    
    @Environment(SSTAARSManager.self) var sstaarsManager
    
    var attendee: EventAttendee
    
    var body: some View {
        NavigationLink(value: attendee) {
            VStack(alignment: .leading) {
                Text(attendee.name)
                switch sstaarsManager.checkCheckInStatus(of: attendee) {
                case .checkedIn:
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.green)
                        Text("Checked In")
                    }
                    .accessibilityElement(children: .combine)
                case .notCheckedIn:
                    HStack {
                        Image(systemName: "xmark.circle.fill")
                        Text("Not Checked In")
                    }
                    .foregroundStyle(.secondary)
                    .accessibilityElement(children: .combine)
                }
            }
        }
    }
}
