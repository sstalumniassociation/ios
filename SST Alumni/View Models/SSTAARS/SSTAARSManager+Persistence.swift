//
//  SSTAARSManager+Persistence.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 23/9/23.
//

import Foundation

extension SSTAARSManager {
    fileprivate func getPersistenceURL() -> URL {
        .documentsDirectory.appending(path: "sstaars.json")
    }
    
    func loadData() {
        do {
            let data = try Data(contentsOf: getPersistenceURL())
            
            let decoder = JSONDecoder()
            
            let events = try decoder.decode([Event].self, from: data)
            
            self.events = events
        } catch {
            self.events = []
        }
    }
    
    func writeData() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(events)
            
            try data.write(to: getPersistenceURL())
        } catch {
            print(error.localizedDescription)
        }
    }
}
