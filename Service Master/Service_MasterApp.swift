//
//  Service_MasterApp.swift
//  Service Master
//
//  Created by Tuan Le on 2023-03-23.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

@main
struct Service_MasterApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    var body: some Scene {
        WindowGroup {
            if Auth.auth().currentUser == nil {
                LandingView()
            } else {
                DashboardView()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
