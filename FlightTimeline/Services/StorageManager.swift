//
//  StoragaManager.swift
//  FlightTimeline
//
//  Created by Serge Broski on 3/14/24.
//

import Foundation
import SwiftUI

class StorageManager {
    static let shared = StorageManager()
    
    @AppStorage("User") private var savedUser: Data?
    
    private init() {}
    
    func saveUser(_ user: User) {
        savedUser = try? JSONEncoder().encode(user)
    }
    
    func loadUser() -> User {
        guard let data = savedUser else { return User() }
        let user = try? JSONDecoder().decode(User.self, from: data)
        return user ?? User()
    }
    
    func removeUser() {
        savedUser = nil
    }
}
