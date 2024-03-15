//
//  TimelineView.swift
//  FlightTimeline
//
//  Created by Serge Broski on 3/14/24.
//

import SwiftUI

struct TimelineView: UIViewControllerRepresentable {
    let flights: [FlightInformation]
    
    func makeUIViewController(context: Context) -> UITableViewController {
        UITableViewController()
    }
    
    func updateUIViewController(_ uiViewController: UITableViewController, context: Context) {
        let timelineTableViewCell = UINib(nibName: "TimelineTableViewCell", bundle: nil)
        
        uiViewController.tableView.register(
            timelineTableViewCell,
            forCellReuseIdentifier: "TimelineTableViewCell"
        )
        
        uiViewController.tableView.dataSource = context.coordinator
        uiViewController.tableView.delegate = context.coordinator
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(flights: flights)
    }
}

extension TimelineView {
    final class Coordinator: NSObject, UITableViewDataSource, UITableViewDelegate {
        let flights: [FlightInformation]
        
        init(flights: [FlightInformation]) {
            self.flights = flights
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            flights.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = .short
            dateFormatter.dateStyle = .none
            
            let flight = flights[indexPath.row]
            
            // Запланированные рейсы
            let scheduledString = dateFormatter.string(from: flight.scheduledTime)
            // Текущие рейсы
            let currentString = dateFormatter.string(from: flight.currentTime ?? flight.scheduledTime)
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath) as? TimelineTableViewCell else { return UITableViewCell() }
            
            var flightInfo = "\(flight.airline) \(flight.number) "
            flightInfo += "\(flight.direction == .departure ? "to" : "from")"
            flightInfo += " \(flight.otherAirport) - \(flight.flightStatus)"
            
            cell.descriptionLabel.text = flightInfo
            cell.titleLabel.text = "On Time for \(scheduledString)"
            
            if flight.status == .cancelled {
                cell.titleLabel.text = "Cancelled"
            } else if flight.timeDifference != 0, flight.status == .cancelled {
                cell.titleLabel.text = "Cancelled"
            } else if flight.timeDifference != 0 {
                cell.titleLabel.text = "\(scheduledString)  Now: \(currentString)"
            }
            
            cell.titleLabel.textColor = .black
            cell.bubbleColor = flight.timelineColor
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

#Preview {
    TimelineView(flights: FlightInformation.generateFlights())
}
