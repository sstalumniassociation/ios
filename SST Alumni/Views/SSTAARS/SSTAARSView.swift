//
//  SSTAARSView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import SwiftUI

struct SSTAARSView: View {
    
    @StateObject var sstaarsManager = SSTAARSManager()
    @State private var accessCodeAlertPresented = false
    @State private var isEventConfirmationViewPresented = false
    
    @State private var eventCode = ""
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section {
                    HStack(alignment: .top) {
                        Text("\(Image(systemName: "ellipsis.rectangle"))")
                            .font(.headline)
                        VStack(alignment: .leading) {
                            Text("SSTAARS Access Code")
                                .font(.headline)
                            Text("This system is meant only for SST Alumni Association event registration volunteers.")
                        }
                    }
                    Button("Enter Access Code") {
                        eventCode = ""
                        accessCodeAlertPresented.toggle()
                    }
                }
                
                if !sstaarsManager.events.isEmpty {
                    Section("My Events") {
                        ForEach($sstaarsManager.events, editActions: .all) { $event in
                            NavigationLink(value: event) {
                                Text(event.name)
                            }
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("SSTAARS")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        accessCodeAlertPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                if !sstaarsManager.events.isEmpty {
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Event.self) { event in
                SSTAARSEventView(path: $path, sstaarsManager: sstaarsManager, event: event)
            }
        }
        .alert("SSTAARS Access Code", isPresented: $accessCodeAlertPresented) {
            TextField("Access Code", text: $eventCode)
            
            Button(role: .cancel) {
                
            } label: {
                Text("Cancel")
            }

            Button("Done") {
                isEventConfirmationViewPresented = true
                Task {
                    await sstaarsManager.retrieveEvent(for: eventCode)
                }
            }
        } message: {
            Text("Enter the event’s access code.")
        }
        .sheet(isPresented: $isEventConfirmationViewPresented) {
            SSTAARSEventConfirmationView(path: $path, sstaarsManager: sstaarsManager)
                .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    SSTAARSView()
}
