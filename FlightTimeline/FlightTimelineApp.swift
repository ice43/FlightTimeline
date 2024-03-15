//
//  FlightTimelineApp.swift
//  FlightTimeline
//
//  Created by Serge Broski on 3/14/24.
//

import SwiftUI

@main
struct FlightTimelineApp: App {
    @State private var loginViewVM = LoginViewViewModel(
        user: StorageManager.shared.loadUser()
    )
    
    var body: some Scene {
        WindowGroup {
            RootView(loginViewVM: loginViewVM)
                .tint(.pink)
        }
    }
}
