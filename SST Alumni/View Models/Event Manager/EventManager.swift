//
//  EventManager.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 4/2/25.
//

import Foundation
import FirebaseAuth
import Observation

@Observable
class EventManager {
    var events: [Event] = [] {
        didSet {
//            writeToCache()
        }
    }
    
    init() {
//        loadArticlesFromCache()
    }
    
    func loadEvents() async {
        do {
            guard let token = try await Auth.auth().currentUser?.getIDToken() else {
                return
            }
            
            var request = URLRequest(url: .cfServer.appendingPathComponent("event"))
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            let events = try decoder.decode([Event].self, from: data)
            
            await MainActor.run {
                self.events = events
                print(events)
            }
        } catch {
            print(error)
            print(error.localizedDescription)
        }
    }
}
