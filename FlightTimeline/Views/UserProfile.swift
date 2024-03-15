//
//  UserProfile.swift
//  FlightTimeline
//
//  Created by Serge Broski on 3/14/24.
//

import SwiftUI

struct UserProfile: View {
    var loginViewVM: LoginViewViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 120, height: 120)
            
            Text("Hello, \(loginViewVM.user.name)!")
                .font(.largeTitle)
            
            Spacer()
            
            Button(action: loginViewVM.logout) {
                Text("Log out")
                    .foregroundStyle(.white)
            }
            .bold()
            .frame(width: 100, height: 50)
            .background(.tint)
            .clipShape(Capsule())
          
            Spacer()
        }
    }
}

#Preview {
    UserProfile(loginViewVM: LoginViewViewModel())
}
