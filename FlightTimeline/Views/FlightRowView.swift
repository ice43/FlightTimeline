//
//  FlightRowView.swift
//  FlightTimeline
//
//  Created by Serge Broski on 3/14/24.
//

import SwiftUI

struct FlightRowView: View {
    let flight: FlightInformation
    
    var body: some View {
        HStack {
            Text("\(flight.airline) \(flight.number)")
                .frame(width: 120, alignment: .leading)
            
            Text(flight.otherAirport)
                .frame(alignment: .leading)
            
            Spacer()
            
            Text(flight.flightStatus)
        }
    }
}

#Preview {
    FlightRowView(flight: FlightInformation.generateFlight())
}
