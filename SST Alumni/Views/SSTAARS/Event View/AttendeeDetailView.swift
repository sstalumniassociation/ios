//
//  AttendeeDetailView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 18/9/23.
//

import SwiftUI

struct AttendeeDetailView: View {
    
    @Environment(SSTAARSManager.self) private var sstaarsManager
    
    var attendee: EventAttendee
    
    var body: some View {
        Form {
            Section("Name") {
                Text(attendee.name)
            }
            
            Section("Status") {
                switch sstaarsManager.checkCheckInStatus(of: attendee) {
                case .checkedIn(let date):
                    Label {
                        Text("Already checked in at \(date.formatted(date: .omitted, time: .shortened))")
                    } icon: {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.green)
                    }
                    
                    Button("Mark as not checked in", systemImage: "person.fill.xmark") {
                        sstaarsManager.update(status: .notCheckedIn, of: attendee)
                    }
                case .notCheckedIn:
                    Label {
                        Text("Not checked in")
                    } icon: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.red)
                    }
                    
                    Button("Check In", systemImage: "person.fill.checkmark") {
                        sstaarsManager.update(status: .checkedIn(.now), of: attendee)
                    }
                }
            }
        }
        .navigationTitle(attendee.name)
    }
}
