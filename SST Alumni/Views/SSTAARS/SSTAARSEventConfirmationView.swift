//
//  SSTAARSEventConfirmationView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 17/9/23.
//

import SwiftUI

struct SSTAARSEventConfirmationView: View {
    
    @ObservedObject var sstaarsManager: SSTAARSManager
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            switch sstaarsManager.eventImportState {
            case .none: ProgressView()
            case .verifying: ProgressView()
            case .serverError:
                VStack(spacing: 16) {
                    Image(systemName: "pc")
                        .symbolRenderingMode(.multicolor)
                        .font(.system(size: 64))
                        
                    Text("Something went wrong.")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("It’s not you, it’s us. Probably.")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary)
                }
                .multilineTextAlignment(.center)
            case .notFound:
                VStack(spacing: 16) {
                    Image(systemName: "eyes")
                        .font(.system(size: 64))
                    
                    Text("Could not find event.")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("This is on you. Definitely you.")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary)
                }
                .multilineTextAlignment(.center)
            case .success(let event):
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
                            
                            HStack {
                                Image(systemName: "calendar")
                                    .frame(width: 32)
                                Text(event.startDateTime.formatted(date: .abbreviated, time: .shortened))
                            }
                            .foregroundStyle(.secondary)
                            
                            HStack {
                                Image(systemName: "person.2.fill")
                                    .frame(width: 32)
                                Text("\(300) attendees")
                            }
                            .foregroundStyle(.secondary)
                            
                            Divider()
                            
                            Text(event.description)
                        }
                    }
                    
                    Button {
                        dismiss()
                        withAnimation {
                            sstaarsManager.events.append(event)
                        }
                    } label: {
                        Text("Access Event")
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
    }
}
