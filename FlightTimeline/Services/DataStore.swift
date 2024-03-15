//
//  DataStore.swift
//  FlightTimeline
//
//  Created by Serge Broski on 3/15/24.
//

import Foundation

final class DataStore {
    static let shared = DataStore()
    
    let username = "user"
    let password = "pass"
    
    private init() {}
}
