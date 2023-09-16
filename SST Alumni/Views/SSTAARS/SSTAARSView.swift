//
//  SSTAARSView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import SwiftUI

struct SSTAARSView: View {
    
    @State private var accessCodeAlertPresented = false
    
    var body: some View {
        NavigationStack {
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
                        accessCodeAlertPresented.toggle()
                    }
                }
                
                Section("My Events") {
                    NavigationLink("SST Homecoming 2024") {
                        SSTAARSEventView()
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("SSTAARS")
            .toolbar {
                Button {
                    accessCodeAlertPresented.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .alert("SSTAARS Access Code", isPresented: $accessCodeAlertPresented) {
            TextField("", text: .constant(""))
            Button(role: .cancel) {
                
            } label: {
                Text("Cancel")
            }

            
            Button("Done") {
                accessCodeAlertPresented.toggle()
            }
        } message: {
            Text("Enter the event's access code.")
        }
    }
}

#Preview {
    SSTAARSView()
}
