//
//  EventsView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import SwiftUI

struct EventsView: View {
    
    @State private var eventManager = EventManager()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(eventManager.events) { event in
                    EventCardView(event: event)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .buttonStyle(.plain)
            .navigationTitle("Events")
            .refreshable {
                await eventManager.loadEvents()
            }
        }
        .task {
            await eventManager.loadEvents()
        }
    }
}

#Preview {
    EventsView()
}
