//
//  PhotoInfoController.swift.swift
//  Space Photo
//
//  Created by Wayne on 2021/12/12.
//

import Foundation
import UIKit


class PhotoInfoController {
    
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

    enum PhotoInfoError: Error, LocalizedError {
        case imageDataMissing
    }
    
    func fetchImage(from url: URL, completion: @escaping (Result<UIImage, Error>)-> Void) {
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            if let data = data,
               let image = UIImage(data: data)
            {
                completion(.success(image))
            } else if let error = error {
                completion(.failure(error))
            } else {
                completion(.failure(PhotoInfoError.imageDataMissing))
            }
        }
        task.resume()
        
    }
}
