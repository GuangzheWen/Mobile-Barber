import UIKit
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: URL
    var copyright: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case description = "explanation"
        case url
        case copyright
    }
}

//var greeting = "Hello, playground"

//let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")!
//URL(string: "https://www.baidu.com")!

//
//print(url.scheme)
//
//print(url.host)
//
//print(url.query)

func fetchPhoto(completion: @escaping (Result<PhotoInfo, Error>) -> Void){
    var urlComponents = URLComponents(string: "https://api.nasa.gov/planetary/apod")!
    urlComponents.queryItems = [
        "api_key": "DEMO_KEY",
        "date": "2013-07-16"
    ].map {
        URLQueryItem(name: $0.key, value: $0.value)
    }


    let task = URLSession.shared.dataTask(with: urlComponents.url!) {
        data, response, error in
        let p = JSONDecoder()
        if let data = data {
        //        print(data)
        //        print(String(data: data, encoding: .utf8)!)
            do {
                let photo = try p.decode(PhotoInfo.self, from: data)
                completion(.success(photo))
            } catch {
                completion(.failure(error))
            }
        }
    }

    task.resume()

}

    fetchPhoto { (result) in
        switch result {
        case .success(let photoInfo):
            print(photoInfo.title)
            print(photoInfo.url)
            print(photoInfo.copyright)
        case .failure(let error):
            print(error)
        }
    }
    PlaygroundPage.current.finishExecution()
