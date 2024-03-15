//
//  ContentView.swift
//  FlightTimeline
//
//  Created by Serge Broski on 3/14/24.
//

import SwiftUI

struct ContentView: View {
    var loginViewVM: LoginViewViewModel
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "airplane")
                    Text("Home")
                }
            
            UserProfile(loginViewVM: loginViewVM)
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    ContentView(loginViewVM: LoginViewViewModel())
}
