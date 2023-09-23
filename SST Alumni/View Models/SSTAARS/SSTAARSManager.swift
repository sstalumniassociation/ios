//
//  SSTAARSManager.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 17/9/23.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift
import FirebaseAuth

class SSTAARSManager: ObservableObject {
    
    @Published var events: [Event] = [] {
        didSet {
            writeData()
        }
    }
    
    @Published var observedEvent: Event?
    
    @Published var eventImportState = EventImportState.none
    
    @Published var attendeeCheckInInfo: [String: Double] = [:]
    
    var ref: DatabaseReference!
    
    init() {
        ref = Database.database(url: "https://sstaa-app-default-rtdb.asia-southeast1.firebasedatabase.app").reference()
        
        loadData()
    }
    
    func retrieveEvent(for id: String) async {
        await MainActor.run {
            eventImportState = .verifying
        }
        
        var request = URLRequest(url: .cfServer.appendingPathComponent("event/\(id)"))
        
        do {
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let token = try await Auth.auth().currentUser!.getIDToken()
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
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
    
    func attachListener(to event: Event) {
        observedEvent = event
        
        ref.child(event.id).observe(.value) { snapshot in
            guard let value = snapshot.value as? [String: Double] else { return }
            
            Task {
                await MainActor.run {
                    self.attendeeCheckInInfo = value
                }
            }
        }
    }
    
    func checkCheckInStatus(of attendee: EventAttendee) -> CheckInStatus {
        let attendeeAdmissionTime = attendeeCheckInInfo[attendee.admissionKey]
        
        if let attendeeAdmissionTime {
            return .checkedIn(Date(timeIntervalSince1970: attendeeAdmissionTime))
        } else {
            return .notCheckedIn
        }
    }
    
    func update(status: CheckInStatus, of attendee: EventAttendee) {
        guard let observedEvent else { return }
        
        switch status {
        case .checkedIn(let date):
            ref.child(observedEvent.id).child(attendee.admissionKey).setValue(date.timeIntervalSince1970)
        case .notCheckedIn:
            ref.child(observedEvent.id).child(attendee.admissionKey).removeValue()
        }
    }
}

enum CheckInStatus {
    case checkedIn(Date)
    case notCheckedIn
}

enum EventImportState {
    case none
    case verifying
    case success(Event)
    case notFound
    case serverError
}
