//
//  AcknowledgementsView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 19/9/23.
//

import SwiftUI

struct AcknowledgementsView: View {
    var body: some View {
        List {
            Section {
                Link("View on GitHub", destination: URL(string: "https://github.com/sstalumniassociation/ios")!)
            } header: {
                Label("Open Source", systemImage: "curlybraces")
            }
            
            Section {
                Link(destination: URL(string: "https://github.com/jiachenyee")!) {
                    Label {
                        VStack(alignment: .leading) {
                            Text("Jia Chen")
                            Text("Class of 2020")
                                .foregroundStyle(.secondary)
                        }
                        .foregroundStyle(Color(uiColor: .label))
                    } icon: {
                        Image(systemName: "person.fill")
                    }
                }
                Link(destination: URL(string: "https://github.com/qin-guan")!) {
                    Label {
                        VStack(alignment: .leading) {
                            Text("Qin Guan")
                            Text("Class of 2020")
                                .foregroundStyle(.secondary)
                        }
                        .foregroundStyle(Color(uiColor: .label))
                    } icon: {
                        Image(systemName: "person.fill")
                    }
                }
                Link(destination: URL(string: "https://github.com/arashnrim")!) {
                    Label {
                        VStack(alignment: .leading) {
                            Text("Arash")
                            Text("Class of 2021")
                                .foregroundStyle(.secondary)
                        }
                        .foregroundStyle(Color(uiColor: .label))
                    } icon: {
                        Image(systemName: "person.fill")
                    }
                }
                Link(destination: URL(string: "https://github.com/Ethan-Chew")!) {
                    Label {
                        VStack(alignment: .leading) {
                            Text("Ethan Chew")
                            Text("Class of 2022")
                                .foregroundStyle(.secondary)
                        }
                        .foregroundStyle(Color(uiColor: .label))
                    } icon: {
                        Image(systemName: "person.fill")
                    }
                }
            } header: {
                Label("Development Team", systemImage: "person.3.fill")
            }
            
            Section {
                Link(destination: URL(string: "https://github.com/firebase/firebase-ios-sdk")!) {
                    Label {
                        VStack(alignment: .leading) {
                            Text("Firebase iOS SDK")
                            Text("Licensed under the Apache License 2.0.")
                                .foregroundStyle(.secondary)
                        }
                        .foregroundStyle(Color(uiColor: .label))
                    } icon: {
                        Image(systemName: "flame")
                            .foregroundStyle(Color.accentColor)
                    }
                }
                
                Link(destination: URL(string: "https://github.com/Alamofire/Alamofire")!) {
                    Label {
                        VStack(alignment: .leading) {
                            Text("Alamofire")
                            Text("Licensed under the MIT License.")
                                .foregroundStyle(.secondary)
                        }
                        .foregroundStyle(Color(uiColor: .label))
                    } icon: {
                        Image(systemName: "network")
                            .foregroundStyle(Color.accentColor)
                    }
                }
                Link(destination: URL(string: "https://github.com/jiachenyee/ScreenCaptureRedaction")!) {
                    Label {
                        VStack(alignment: .leading) {
                            Text("ScreenCaptureRedaction")
                            Text("Licensed under the MIT License.")
                                .foregroundStyle(.secondary)
                        }
                        .foregroundStyle(Color(uiColor: .label))
                    } icon: {
                        Image(systemName: "text.redaction")
                            .foregroundStyle(Color.accentColor)
                    }
                }
            } header: {
                Label("Packages & Libraries", systemImage: "shippingbox.fill")
            }
        }
        .navigationTitle("Acknowledgements")
    }
}

#Preview {
    AcknowledgementsView()
}
