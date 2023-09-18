//
//  SST_AlumniApp.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAppCheck

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let providerFactory = SSTAAAppCheckProviderFactory()
        
        AppCheck.setAppCheckProviderFactory(providerFactory)
        FirebaseApp.configure()
        return true
    }
}

@main
struct SST_AlumniApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
