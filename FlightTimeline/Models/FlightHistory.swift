import SwiftUI

class FlightHistory: NSObject {
    let day: Int
    let flightId: Int
    let date: Date
    let status: FlightStatus
    let scheduledTime: Date
    var actualTime: Date?
    
    var shortDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return formatter.string(from: date)
    }
    
    var timeDifference: Int {
        guard let actual = actualTime else { return 60 }
        let diff = Calendar.current.dateComponents([.minute], from: scheduledTime, to: actual)
        return diff.minute ?? 0
    }
    
    var flightDelayDescription: String {
        if status == .cancelled {
            return "Cancelled"
        }
        
        if timeDifference < 0 {
            return "Early by \(-timeDifference) minutes."
        } else if timeDifference == 0 {
            return "On time"
        } else {
            return "Late by \(timeDifference) minutes."
        }
    }
    
    var delayColor: Color {
        if status == .cancelled {
            return Color(red: 0.5, green: 0, blue: 0)
        }
        
        if timeDifference <= 0 {
            return .green
        }
        
        if timeDifference <= 15 {
            return .yellow
        }
        
        return .red
    }
    
    init(day: Int, id: Int, date: Date, direction: FlightDirection, status: FlightStatus, scheduledTime: Date, actualTime: Date?) {
        self.day = day
        self.flightId = id
        self.date = date
        self.status = status
        self.scheduledTime = scheduledTime
        self.actualTime = actualTime
    }
    
    func calcOffset(_ width: CGFloat) -> CGFloat {
        CGFloat(CGFloat(day - 1) * width)
    }
}
