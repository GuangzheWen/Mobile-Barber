import Foundation

struct Customer: Equatable, Codable, Comparable {
    
//    let id = UUID()
    var firstName: String
    var lastName: String
    var emailAddress: String
    
    var age: String
    var sex: String
    
    var username: String
    var password: String
    
    static func < (lhs: Customer, rhs: Customer) -> Bool {
        return lhs.firstName < rhs.firstName
    }
    
//    enum CodingKeys: String, CodingKey {
//        case fisrName
//        case lastName
//        case emailAddress
//        case age
//        case sex
//    }
    
    static let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentDirectory.appendingPathComponent("customer").appendingPathExtension("plist")
    
    static func loadCustomerFromDisk() -> Customer?{
        guard let customer = try? Data(contentsOf: archiveURL)
        else {
            return nil
        }
        let propertyDecoder = PropertyListDecoder()
        return try? propertyDecoder.decode(Customer.self, from: customer)
    }
    
    static func saveCustomerToDisk(customer: Customer) {
        let propertyEncoder = PropertyListEncoder()
        let codedCustomer = try? propertyEncoder.encode(customer)
        try? codedCustomer?.write(to: archiveURL, options: .noFileProtection)
    }
    

}
