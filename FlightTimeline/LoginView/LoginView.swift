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
        HStack {
            VStack(spacing: 20) {
                LoginText(text: "USERNAME:")
                LoginText(text: "PASSWORD:")
            }
            .padding(.leading, 30)
            
            VStack(spacing: 20) {
                TextField("Enter your name", text: $loginViewVM.user.name)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .multilineTextAlignment(.leading)
                
                SecureField("Enter your password", text: $loginViewVM.user.pass)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .multilineTextAlignment(.leading)
            }
            .padding(.leading, 20)
        }
        
        Button(action: loginViewVM.checkLogin) {
            Label("Log in", systemImage: "checkmark.circle")
        }
        .alert("Error", isPresented: $loginViewVM.alertIsPresented) {
            Button("OK") { loginViewVM.clearPass() }
        } message: {
            Text("Incorrect username or password")
        }
        
        .disabled(!loginViewVM.fieldsNotEmpty)
        .offset(y: 15)
        

    }
}

#Preview {
    LoginView(loginViewVM: LoginViewViewModel())
}
