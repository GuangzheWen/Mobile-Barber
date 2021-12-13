
import Foundation

struct Barber: Equatable, Comparable, Codable {

    var shopName: String
    
    static func < (lhs: Barber, rhs: Barber) -> Bool {
        lhs.shopName < rhs.shopName
    }
    
    static func loadSampleBarberShop() -> [Barber] {
        return [
            Barber(shopName: "barber sample 1"),
            Barber(shopName: "barber sample 2"),
            Barber(shopName: "barber sample 3")
        ]
    }
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("barbers").appendingPathExtension("plist")
    static func loadBarbersFromDisk() -> [Barber]? {
        guard let barbers = try? Data(contentsOf: archiveURL)
        else {
            return nil
        }
        let propertyDecoder = PropertyListDecoder()
        return try? propertyDecoder.decode(Array<Barber>.self, from: barbers)
    }
    static func saveBarbers(barbers: [Barber]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedBarbers = try? propertyListEncoder.encode(barbers)
        try? codedBarbers?.write(to: archiveURL, options: .noFileProtection)
    }
    
}
