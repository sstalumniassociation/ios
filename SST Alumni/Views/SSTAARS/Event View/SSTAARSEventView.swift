//
//  SSTAARSEventView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import SwiftUI

struct SSTAARSEventView: View {
    
    var event: Event
    
    @State private var searchText = ""
    
    @State private var isQRScannerPresented = false
    
    var body: some View {
        List {
            Section {
                HStack {
                    Image(systemName: "person.3.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64)
                        .foregroundStyle(Color.accentColor)
                    HStack(alignment: .lastTextBaseline, spacing: 0) {
                        Text("0")
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
            
            
            Section("Attendees") {
                ForEach(event.attendees) { attendee in
                    AttendeeRowView(attendee: attendee)
                }
            }
        }
        .navigationTitle(event.name)
        .searchable(text: $searchText, prompt: "Search Attendees")
        .sheet(isPresented: $isQRScannerPresented) {
            QRCodeScannerView()
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
    }
}
