//
//  SSTAARSEventView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import SwiftUI

struct SSTAARSEventView: View {
    
    @Binding var path: NavigationPath
    
    @ObservedObject var sstaarsManager: SSTAARSManager
    
    var event: Event
    
    @State private var searchText = ""
    @State private var isInvalidQRCodeAlertPresented = false
    
    @State private var isQRScannerPresented = false
    
    var body: some View {
        List {
            if searchText.isEmpty {
                Section {
                    HStack {
                        Image(systemName: "person.3.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 64)
                            .foregroundStyle(Color.accentColor)
                        HStack(alignment: .lastTextBaseline, spacing: 0) {
                            Text("\(sstaarsManager.attendeeCheckInInfo.count)")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Text("/\(event.attendees.count)")
                                .font(.title2)
                                .fontWeight(.medium)
                            
                            Text(" checked in")
                        }
                        .padding(.leading)
                    }
                    .padding(.vertical)
                }
                
                Section {
                    Button {
                        isQRScannerPresented.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "qrcode.viewfinder")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 64)
                                .foregroundStyle(Color.accentColor)
                            
                            VStack(alignment: .leading) {
                                Text("Scan QR Code")
                                    .font(.headline)
                                
                                Text("Check an attendee in by scanning their QR code.")
                            }
                            .padding(.leading)
                            .foregroundStyle(Color(uiColor: .label))
                        }
                        .padding(.vertical)
                    }
                }
            }
            
            Section("Attendees") {
                ForEach(event.attendees) { attendee in
                    if searchText.isEmpty || attendee.name.lowercased().contains(searchText.lowercased()) {
                        AttendeeRowView(sstaarsManager: sstaarsManager, attendee: attendee)
                    }
                }
            }
        }
        .navigationTitle(event.name)
        .searchable(text: $searchText, prompt: "Search Attendees")
        .sheet(isPresented: $isQRScannerPresented) {
            QRCodeScannerView { string in
                if let attendee = event.attendees.first(where: { $0.admissionKey == string }) {
                    path.append(attendee)
                } else {
                    isInvalidQRCodeAlertPresented.toggle()
                }
            }
        }
        .refreshable {
            await sstaarsManager.refreshEvent(for: event.id)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isQRScannerPresented.toggle()
                } label: {
                    Label("Scan QR Code", systemImage: "qrcode.viewfinder")
                }
            }
        }
        .alert("Invalid QR Code", isPresented: $isInvalidQRCodeAlertPresented) {
            Button("OK") {}
        }
        .navigationDestination(for: EventAttendee.self) { attendee in
            AttendeeDetailView(sstaarsManager: sstaarsManager, attendee: attendee)
        }
        .onAppear {
            sstaarsManager.attachListener(to: event)
        }
    }
}
