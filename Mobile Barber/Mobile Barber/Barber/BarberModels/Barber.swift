import Foundation
import UIKit



// struct to store barber information
struct Barber: Equatable, Comparable, Codable {

    // necessary properties
    var shopName: String
    var ratePoints: Double
    var loacationDescription: String
    var serviceForGender: String
    var servicesTypes: [String]
    var photoProfile: String
    var phoneNumber: String?
    
    // comparable protocol required function
    static func < (lhs: Barber, rhs: Barber) -> Bool {
        lhs.shopName < rhs.shopName
    }
    
    // for testing, load sample data
    static func loadSampleBarberShop() -> [Barber] {
        return [
            Barber(shopName: "Corner Barber Shop", ratePoints: 5.0, loacationDescription: "Solly Street, Sheffield, UK", serviceForGender: "Female/Male", servicesTypes: ["Basic Haircut", "Hair-washing", "Perm"], photoProfile: "SampleProfile1" ),
            Barber(shopName: "Maxx Barber Shop", ratePoints: 5.0, loacationDescription: "Temple Street, Bristol, UK", serviceForGender: "Female", servicesTypes: ["Basic Haircut", "Hair-washing", "Perm"], photoProfile: "SampleProfile2" ),
            Barber(shopName: "Eastern Barber Shop", ratePoints: 5.0, loacationDescription: "Edward Street, Sheffield, UK", serviceForGender: "Female/Male", servicesTypes: ["Hair-washing", "Perm"], photoProfile: "SampleProfile1" ),
            
        ]
    }
    
    // consistent data to disk, to app specific container
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    // specify file name barbers.plist to store sample barbers to disk
    static let archiveURL = documentsDirectory.appendingPathComponent("barbers").appendingPathExtension("plist")
    
    // load barbers data from disk, certain file
    static func loadBarbersFromDisk() -> [Barber]? {
        guard let barbers = try? Data(contentsOf: archiveURL)
        else {
            return nil
        }
        let propertyDecoder = PropertyListDecoder()
        return try? propertyDecoder.decode(Array<Barber>.self, from: barbers)
    }
    
    // save barbers data to disk. certain file 
    static func saveBarbers(barbers: [Barber]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedBarbers = try? propertyListEncoder.encode(barbers)
        try? codedBarbers?.write(to: archiveURL, options: .noFileProtection)
    }
    
}
