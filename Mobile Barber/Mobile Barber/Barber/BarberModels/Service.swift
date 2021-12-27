import Foundation

struct Service: Equatable, Comparable, Codable {
    
    var serviceName: String
    var serviceDescription: String
    
    static func < (lhs: Service, rhs: Service) -> Bool {
        return lhs.serviceName < rhs.serviceName
    }
    
    // used for testing phase
    static func loadSampleServices() -> [Service] {
        return [
            Service(serviceName: "Hair washing", serviceDescription: "This service is for washing hair"),
            Service(serviceName: "Basic haircut", serviceDescription: "This service is usually ordered by male, and provides basic haircut for short hair"),
            Service(serviceName: "Perm", serviceDescription: "This service provides operations on hair, and make it curling")
        ]
    }
    
    // consistent data to disk, to app specific container
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    // specify file name barbers.plist to store sample barbers to disk
    static let archiveURL = documentsDirectory.appendingPathComponent("services").appendingPathExtension("plist")
    
    // load barbers data from disk, certain file
    static func loadServicesFromDisk() -> [Service]? {
        guard let services = try? Data(contentsOf: archiveURL)
        else {
            return nil
        }
        let propertyDecoder = PropertyListDecoder()
        return try? propertyDecoder.decode(Array<Service>.self, from: services)
    }
    
    // save barbers data to disk. certain file
    static func saveServices(services: [Service]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedServices = try? propertyListEncoder.encode(services)
        try? codedServices?.write(to: archiveURL, options: .noFileProtection)
    }
}
