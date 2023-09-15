//
//  SSTAARSEventView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import SwiftUI

struct SSTAARSEventView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        List {
            HStack {
                Image(systemName: "person.3.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64)
                    .foregroundStyle(Color.accentColor)
                
                HStack(alignment: .lastTextBaseline, spacing: 0) {
                    Text("123")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("/400")
                        .font(.title2)
                        .fontWeight(.medium)
                    
                    Text(" checked in")
                }
                .padding(.leading)
                Spacer()
            }
            .padding()
            .background(Color(uiColor: .systemGray5))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .listRowSeparator(.hidden)
            
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
                Spacer()
            }
            .padding()
            .background(Color(uiColor: .systemGray5))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .listRowSeparator(.hidden)
            
            Section("Attendees") {
                VStack(alignment: .leading) {
                    Text("Jia Chen Yee")
                    HStack {
                        Image(systemName: "xmark.circle.fill")
                        Text("Not Checked In")
                    }
                    .foregroundStyle(.secondary)
                }
            }
            
        }
        .navigationTitle("SST Homecoming 2024")
        .refreshable {
            
        }
        .searchable(text: $searchText, prompt: Text("Search Attendees"))
    }
}

#Preview {
    SSTAARSEventView()
}
