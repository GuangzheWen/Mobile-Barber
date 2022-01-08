import UIKit
import Foundation

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

 let urlString = "https://raw.githubusercontent.com/GuangzheWen/Mobile-Barber/main/Sample%20data/appointmentsSampleData.json"


struct Appointment:  Codable {

    var id: String
    var date: Date

    var customerUsername: String
    var barberShopName: String

    var serviceType: String
    var cost: Double
    var orderTimeStamp: Date
}

func fetchAppointments(completion: @escaping (Result<[Appointment], Error>) -> Void) {
    let urlComponents = URLComponents(string: urlString)!

    let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, reponse, error in
        print(1)
        let jsonDecoder = JSONDecoder()
        if let data = data {
            do {
                let appointments = try jsonDecoder.decode(Array<Appointment>.self, from: data)
                completion(.success(appointments))
            } catch  {
                completion(.failure(error))
            }
        }
    }

    task.resume()
}

//let a =  Appointment(id: "01", date: Date().addingTimeInterval(24*60*60), customerUsername: "user 1", barberShopName: "barber 1", serviceType: "service 1", cost: 10.0, orderTimeStamp: Date())
//var b: [Appointment] = []
//b.append(a)
//b.append(a)
//
//let encoder = JSONEncoder()
//let c = try encoder.encode(b)
//
//
//print(String(data: c, encoding: .utf8)!)

fetchAppointments { (result) in
    switch result {
    case .success(let appointments):
        print(appointments[0])
    case .failure(let error):
        print(error)
    }

}
PlaygroundPage.current.finishExecution()
//print(123)



