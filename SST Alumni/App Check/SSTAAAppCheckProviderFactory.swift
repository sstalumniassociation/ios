//
//  SSTAAAppCheckProviderFactory.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 17/9/23.
//

import Foundation
import FirebaseAppCheck
import FirebaseCore

class SSTAAAppCheckProviderFactory: NSObject, AppCheckProviderFactory {
    func createProvider(with app: FirebaseApp) -> AppCheckProvider? {
        return AppAttestProvider(app: app)
    }
}
