import Foundation

// struct to store apointment information
struct Appointment: Equatable, Comparable, Codable {
    
    // necessary propterties
    var id: String
    var date: Date
    
    var customerUsername: String
    var barberShopName: String
    
    var serviceType: String
    var cost: Double
    var orderTimeStamp: Date
    
    // non-instance property to generate date data
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        return dateFormatter
    } ()
    
    // comparable protocol required function
    static func < (lhs: Appointment, rhs: Appointment) -> Bool {
        lhs.date < rhs.date
    }
    
    // for testing, load sample data
    static func loadSampleAppointments() -> [Appointment] {
        return [
            Appointment(id: "01", date: Date().addingTimeInterval(24*60*60), customerUsername: "user 1", barberShopName: "barber 1", serviceType: "service 1", cost: 10.0, orderTimeStamp: Date()),
            
            Appointment(id: "02", date: Date().addingTimeInterval(24*60*60), customerUsername: "user 2", barberShopName: "barber 2", serviceType: "service 2", cost: 20.0, orderTimeStamp: Date()),
            
            Appointment(id: "03", date: Date().addingTimeInterval(24*60*60), customerUsername: "user 3", barberShopName: "barber 3", serviceType: "service 3", cost: 30.0, orderTimeStamp: Date()),
            
            Appointment(id: "04", date: Date().addingTimeInterval(24*60*60), customerUsername: "user 4", barberShopName: "barber 4", serviceType: "service 4", cost: 40.0, orderTimeStamp: Date()),
        
        ]
    }
    
    // consistent data to disk, to app specific container
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    // specify file name barbers.plist to store sample barbers to disk
    static let archiveURL = documentsDirectory.appendingPathComponent("appointments").appendingPathExtension("plist")
    
    
    // load barbers data from disk, certain file
    static func loadAppointmentsFromDisk() -> [Appointment]? {
        guard let appointments = try? Data(contentsOf: archiveURL) else{
            return nil
        }
        let propertyDecoder = PropertyListDecoder()
        return try? propertyDecoder.decode(Array<Appointment>.self, from: appointments)
    }
    
    // save barbers data to disk. certain file
    static func saveAppointments(appointments: [Appointment]) {
        let propertyEncoder = PropertyListEncoder()
        let codedAppointments = try? propertyEncoder.encode(appointments)
        try? codedAppointments?.write(to: archiveURL, options: .noFileProtection)
    }
}
