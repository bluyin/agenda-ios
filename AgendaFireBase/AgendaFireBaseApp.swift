//
//  AgendaFireBaseApp.swift
//  AgendaFireBase
//
//  Created by Bluyin  on 17/1/23.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?)-> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct AgendaFireBaseApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    var body: some Scene {
        WindowGroup {
            if let _ = authenticationViewModel.user{
                //ApiList()
                HomeView(authenticationViewModel: authenticationViewModel)
            }else{
                AuthenticationView(authenticationViewModel: authenticationViewModel)
            }
        }
    }
}
