import Foundation

class ServiceController {
    func fetchServices(completion: @escaping (Result<[Service], Error>) -> Void) {
        let urlString = baseURL + "/Service"
        
        var urlComponents = URLComponents(string: urlString)!
        urlComponents.queryItems = [
            "api_key": "DEMO_KEY"
        ].map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) {
            data, response, error in
            
            let jsonDecoder = JSONDecoder()
            
            if let data = data {
                do {
                    let services = try jsonDecoder.decode(Array<Service>.self, from: data)
                    completion(.success(services))
                } catch {
                    completion(.failure(error))
                }
            }
             
        }
        task.resume()
    }
    func pushServices(services: [Service], completion: @escaping (Result<[Service], Error>) -> Void) {
        let urlString = baseURL + "/pushServices"
        
        var urlComponents = URLComponents(string: urlString)!
        //        urlComponents.queryItems = [
        ////           example header keys
        //            "api_key": "DEMO_KEY"
        //        ].map {
        //            URLQueryItem(name: $0.key, value: $0.value)
        //        }
        
        let jsonEncoder = JSONEncoder()
        let data = try? jsonEncoder.encode(services)
        let urlRequest = URLRequest(url: urlComponents.url!)
        let pushTask = URLSession.shared.uploadTask(with: urlRequest, from: data!)
        
        pushTask.resume()
        
    }
}
