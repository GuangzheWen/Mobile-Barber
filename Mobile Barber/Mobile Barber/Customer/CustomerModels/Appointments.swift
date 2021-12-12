
import Foundation


struct Appointment: Equatable, Comparable, Codable {
    
    var id: String
    var date: Date
    
    var customerUsername: String
    var barberShopName: String
    
    var serviceType: String
    var cost: Double
    var orderTimeStamp: Date
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        return dateFormatter
    } ()
    
    static func < (lhs: Appointment, rhs: Appointment) -> Bool {
        lhs.date < rhs.date
    }
    
    static func loadSampleAppointments() -> [Appointment] {
        return [
            Appointment(id: "01", date: Date().addingTimeInterval(24*60*60), customerUsername: "user 1", barberShopName: "barber 1", serviceType: "service 1", cost: 10.0, orderTimeStamp: Date()),
            
            Appointment(id: "02", date: Date().addingTimeInterval(24*60*60), customerUsername: "user 2", barberShopName: "barber 2", serviceType: "service 2", cost: 20.0, orderTimeStamp: Date()),
            
            Appointment(id: "03", date: Date().addingTimeInterval(24*60*60), customerUsername: "user 3", barberShopName: "barber 3", serviceType: "service 3", cost: 30.0, orderTimeStamp: Date()),
            
            Appointment(id: "04", date: Date().addingTimeInterval(24*60*60), customerUsername: "user 4", barberShopName: "barber 4", serviceType: "service 4", cost: 40.0, orderTimeStamp: Date()),
        
        ]
    }
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("appointments").appendingPathExtension("plist")
    
    static func loadAppointmentsFromDisk() -> [Appointment]? {
        guard let appointments = try? Data(contentsOf: archiveURL) else{
            return nil
        }
        let propertyDecoder = PropertyListDecoder()
        return try? propertyDecoder.decode(Array<Appointment>.self, from: appointments)
    }
    static func saveAppointments(appointments: [Appointment]) {
        let propertyEncoder = PropertyListEncoder()
        let codedAppointments = try? propertyEncoder.encode(appointments)
        try? codedAppointments?.write(to: archiveURL, options: .noFileProtection)
    }
}
