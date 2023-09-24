//
//  SSTAARSEventConfirmationSuccessView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 17/9/23.
//

import SwiftUI

struct SSTAARSEventConfirmationSuccessView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var path: NavigationPath
    @Binding var allEvents: [Event]
    
    var event: Event
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text(event.name)
                        .font(.title)
                        .padding(.top)
                        .fontWeight(.bold)
                    Text(event.id)
                        .font(.caption)
                        .monospaced()
                        .foregroundStyle(.secondary)
                        .speechSpellsOutCharacters()
                    
                    HStack {
                        Image(systemName: "calendar")
                            .frame(width: 32)
                        Text(event.startDateTime.formatted(date: .abbreviated, time: .shortened))
                    }
                    .foregroundStyle(.secondary)
                    .accessibilityElement(children: .combine)
                    
                    HStack {
                        Image(systemName: "person.2.fill")
                            .frame(width: 32)
                        Text("\(event.attendees.count) attendees")
                    }
                    .foregroundStyle(.secondary)
                    .accessibilityElement(children: .combine)
                    
                    Divider()
                    
                    Text(event.description)
                }
            }
            
            Button {
                dismiss()
                withAnimation {
                    allEvents.append(event)
                    path.append(event)
                }
            } label: {
                Text("Accept Invite")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                dismiss()
            } label: {
                Text("Cancel")
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderless)
        }
        .padding([.horizontal, .top])
    }
}
