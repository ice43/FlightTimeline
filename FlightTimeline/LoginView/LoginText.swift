//
//  LoginText.swift
//  FlightTimeline
//
//  Created by Serge Broski on 3/15/24.
//

import SwiftUI

struct LoginText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .opacity(0.4)
    }
}

#Preview {
    LoginText(text: "USERNAME:")
}
