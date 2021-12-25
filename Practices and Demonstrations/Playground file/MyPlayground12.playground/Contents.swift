import UIKit
import Foundation

struct Employee: Comparable, Equatable, Codable {
    static func < (lhs: Employee, rhs: Employee) -> Bool {
        lhs.lastName < rhs.lastName
    }

    var firstName: String
    var lastName: String
    var jobTitle: String
    var phoneNumber: String
    

}

let ben = Employee(firstName: "Leez", lastName: "Ben", jobTitle: "worker", phoneNumber: "12345")
print(ben)
let jsonEnconder = JSONEncoder()
print(jsonEnconder)
if let jsonData = try? jsonEnconder.encode(ben) {
    print(jsonData)
    let jsonString = String(data: jsonData, encoding: .utf8)
    print(jsonString!)
    let deCoder = JSONDecoder()
    if let sth = try? deCoder.decode(Employee.self, from: jsonData) {
        print(sth)
    }
}
