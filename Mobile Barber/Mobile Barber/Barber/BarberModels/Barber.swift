
import Foundation

struct Barber: Equatable, Comparable, Codable {
    static func < (lhs: Barber, rhs: Barber) -> Bool {
        lhs.shopName < rhs.shopName
    }
    
    var shopName: String
    
    var username: String
    var password: String
    
}
