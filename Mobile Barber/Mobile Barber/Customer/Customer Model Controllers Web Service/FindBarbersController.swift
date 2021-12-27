import Foundation



// assistant controller to help fetch data through web service
class FindBarbersController {
    func fetchFindBarbers(completion: @escaping (Result<[Barber], Error>) -> Void) {
        // uncomment following code to implement real product
//        let urlString = baseURL + "/FindBarbers"
        
        // comment following code to use sample test
        let urlString = "https://raw.githubusercontent.com/GuangzheWen/Mobile-Barber/main/Sample%20data/barbersSampleData.json"
        
        var urlComponents = URLComponents(string: urlString)!
        // uncomment following code and modify to add http request headers
//                urlComponents.queryItems = [
//        //           example header keys
//                    "api_key": "DEMO_KEY"
//                ].map {
//                    URLQueryItem(name: $0.key, value: $0.value)
//                }
        
        // create a network task to fetch barbers
        let task = URLSession.shared.dataTask(with: urlComponents.url!) {
            data, response, error in
            let jsonDecoder = JSONDecoder()
            if let data = data {
                do {
                    let barbers = try jsonDecoder.decode(Array<Barber>.self, from: data)
                    completion(.success(barbers))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    func pushBarbers(barbers: [Barber], completion: @escaping (Result<[Barber], Error>) -> Void) {
        let urlString = baseURL + "pushBarber"
        
        var urlComponents = URLComponents(string: urlString)!
//        urlComponents.queryItems = [
////           example header keys
//            "api_key": "DEMO_KEY"
//        ].map {
//            URLQueryItem(name: $0.key, value: $0.value)
//        }
        let jsonEncoder = JSONEncoder()
        let data = try? jsonEncoder.encode(barbers)
        let urlRequest = URLRequest(url: urlComponents.url!)
        let pushTask = URLSession.shared.uploadTask(with: urlRequest, from: data!)
        
        pushTask.resume()
    }
}
