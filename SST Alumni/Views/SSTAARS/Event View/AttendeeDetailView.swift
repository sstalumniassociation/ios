//
//  AttendeeDetailView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 18/9/23.
//

import SwiftUI

struct AttendeeDetailView: View {
    
    @ObservedObject var sstaarsManager: SSTAARSManager
    
    var attendee: EventAttendee
    
    var body: some View {
        Form {
            Section("Name") {
                Text(attendee.name)
            }
            
            Section("Status") {
                HStack {
                    switch sstaarsManager.checkCheckInStatus(of: attendee) {
                    case .checkedIn:
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.green)
                        Text("Checked In")
                    case .notCheckedIn:
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.red)
                        Text("Not Checked In")
                    }
                }
                Button("Mark as Checked In") {
                    
                }
            }
        }
        .navigationTitle(attendee.name)
    }
}
