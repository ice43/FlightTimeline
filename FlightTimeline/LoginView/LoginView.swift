//
//  LoginView.swift
//  FlightTimeline
//
//  Created by Serge Broski on 3/14/24.
//

import SwiftUI

struct LoginView: View {
    @Bindable var loginViewVM: LoginViewViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Text("USERNAME:")
                    .font(.subheadline)
                    .opacity(0.4)
                                            
                TextField("Enter your name", text: $loginViewVM.user.name)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .multilineTextAlignment(.leading)
            }
            .padding(.leading, 30)
            
            HStack(spacing: 19) {
                Text("PASSWORD:")
                    .font(.subheadline)
                    .opacity(0.4)
                
                SecureField("Enter your password", text: $loginViewVM.user.pass)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .multilineTextAlignment(.leading)
            }
            .padding(.leading, 30)
            
            
            Button(action: loginViewVM.login) {
                Label("Log in", systemImage: "checkmark.circle")
            }
            .disabled(!loginViewVM.nameIsValid)
        }

    }
}

#Preview {
    LoginView(loginViewVM: LoginViewViewModel())
}
