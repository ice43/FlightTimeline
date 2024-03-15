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
    
    var nameIsValid: Bool {
        !user.name.isEmpty && !user.pass.isEmpty
    }
    
    private let storageManager = StorageManager.shared
    
    init(user: User = User()) {
        self.user = user
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
