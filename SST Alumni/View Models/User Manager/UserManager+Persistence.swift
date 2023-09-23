//
//  UserManager+Persistence.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 24/9/23.
//

import Foundation

extension UserManager {
    fileprivate func getPersistenceURL() -> URL {
        .documentsDirectory.appending(path: "user.json")
    }
    
    func loadUserData() {
        do {
            let data = try Data(contentsOf: getPersistenceURL())
            
            let decoder = JSONDecoder()
            
            let user = try decoder.decode(UserData.self, from: data)
            
            self.user = user
        } catch {
            self.user = nil
        }
    }
    
    func writeData() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(user)
            
            try data.write(to: getPersistenceURL())
        } catch {
            print(error.localizedDescription)
        }
    }
}
