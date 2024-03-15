//
//  RootView.swift
//  FlightTimeline
//
//  Created by Serge Broski on 3/14/24.
//

import SwiftUI

struct RootView: View {
    var loginViewVM: LoginViewViewModel
    
    var body: some View {
        if loginViewVM.user.isLoggedIn {
            ContentView(loginViewVM: loginViewVM)
        } else {
            LoginView(loginViewVM: loginViewVM)
        }
    }
}

#Preview {
    RootView(loginViewVM: LoginViewViewModel())
}
