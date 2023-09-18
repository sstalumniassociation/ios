//
//  AttendeeRowView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 18/9/23.
//

import SwiftUI

struct AttendeeRowView: View {
    
    @ObservedObject var sstaarsManager: SSTAARSManager
    
    var attendee: EventAttendee
    
    var body: some View {
        NavigationLink(value: attendee) {
            VStack(alignment: .leading) {
                Text(attendee.name)
                HStack {
                    Image(systemName: "xmark.circle.fill")
                    Text("Not Checked In")
                }
                .foregroundStyle(.secondary)
            }
        }
    }
}
