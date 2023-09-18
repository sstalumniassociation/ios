//
//  SSTAARSManager.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 17/9/23.
//

import Foundation

class SSTAARSManager: ObservableObject {
    
    @Published var events: [Event] = []
    
    @Published var eventImportState = EventImportState.none
    
    func retrieveEvent(for id: String) async {
        await MainActor.run {
            eventImportState = .verifying
        }
        
        var request = URLRequest(url: .cfServer.appendingPathComponent("event/\(id)"))
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse else { return }
            
            switch response.statusCode {
            case 200...299:
                let decoder = JSONDecoder()
                let event = try decoder.decode(Event.self, from: data)
                
                await MainActor.run {
                    eventImportState = .success(event)
                }
            case 400...499:
                print("Client error \(response.statusCode)")
                await MainActor.run {
                    eventImportState = .notFound
                }
            case 500...599:
                print("Server error \(response.statusCode)")
                await MainActor.run {
                    eventImportState = .serverError
                }
            default: break
            }
            
        } catch {
            print(error.localizedDescription)
            await MainActor.run {
                eventImportState = .notFound
            }
        }
    }
    
    func checkCheckInStatus(of attendee: EventAttendee) -> CheckInStatus {
#warning("Replace this placeholder")
        return Bool.random() ? .notCheckedIn : .notCheckedIn
    }
}

enum CheckInStatus {
    case checkedIn
    case notCheckedIn
}

enum EventImportState {
    case none
    case verifying
    case success(Event)
    case notFound
    case serverError
}
