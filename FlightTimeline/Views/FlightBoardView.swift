//
//  FlightBoardView.swift
//  FlightTimeline
//
//  Created by Serge Broski on 3/14/24.
//

import SwiftUI

struct FlightBoardView: View {
    let title: String
    let flights: [FlightInformation]
    
    @State private var hiddenCancelled = false
    
    private var shownFlights: [FlightInformation] {
        hiddenCancelled
        ? flights.filter { $0.status != .cancelled }
        : flights
    }
    
    var body: some View {
        List(shownFlights) { flight in
            NavigationLink(destination: FlightDetailsView(flight: flight)) {
                FlightRowView(flight: flight)
            }
        }
        .listStyle(.plain)
        .navigationTitle(title)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Toggle("Hide cancelled", isOn: $hiddenCancelled)
            }
        }
    }
}

#Preview {
    FlightBoardView(title: "Board title", flights: FlightInformation.generateFlights())
}
