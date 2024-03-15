//
//  LoginViewViewModel.swift
//  FlightTimeline
//
//  Created by Serge Broski on 3/14/24.
//

import Foundation
import Observation

@Observable
final class LoginViewViewModel  {
    var user = User()
    var alertIsPresented = false
    var forgetAlertIsPresented = false
    
    var nameIsValid: Bool {
        user.name == dataStore.username && user.pass == dataStore.password
    }
    
    var fieldsNotEmpty: Bool {
        !user.name.isEmpty && !user.pass.isEmpty
    }
    
    private let storageManager = StorageManager.shared
    private let dataStore = DataStore.shared
    
    init(user: User = User()) {
        self.user = user
    }
    
    func checkLogin() {
        if fieldsNotEmpty, nameIsValid {
            login()
        } else {
            showAlert()
        }
    }
    
    func showAlert() {
        alertIsPresented.toggle()
    }
    
    func clearPass() {
        user.pass = ""
    }
    
    func forgetPassword() {
        forgetAlertIsPresented.toggle()
    }
    
    func login() {
        user.isLoggedIn.toggle()
        storageManager.saveUser(user)
    }
    
    func logout() {
        user.name = ""
        user.pass = ""
        user.isLoggedIn.toggle()
        storageManager.removeUser()
    }
}
