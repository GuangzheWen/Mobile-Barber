
import Foundation

struct Customer: Equatable, Codable, Comparable {
    
//    let id = UUID()
    var firstName: String
    var lastName: String
    var emailAddress: String
    
    var age: Int
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
}
