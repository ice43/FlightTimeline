//
//  FlightDetailsView.swift
//  FlightTimeline
//
//  Created by Serge Broski on 3/14/24.
//

import SwiftUI

struct FlightDetailsView: View {
    let flight: FlightInformation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("\(flight.airline) - Flight \(flight.number)")
                    .font(.title)
                
                Spacer()
            }
            
            Text("\(flight.direction == .arrival ? "From" : "To") \(flight.otherAirport)")
            
            Text(flight.flightStatus)
                .foregroundStyle(Color(flight.timelineColor))
            
            Spacer()
        }
        .padding()
        .font(.headline)
        .navigationTitle("Flight Details")
    }
}

#Preview {
    FlightDetailsView(flight: FlightInformation.generateFlight())
}
