import UIKit

//var greeting = "Hello, playground"

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var urlComponents = URLComponents(string: "https://itunes.apple.com/search")!

urlComponents.queryItems = [
    "term": "周杰伦",
    "media": "music"

].map() {
    URLQueryItem(name: $0.key, value: $0.value)
}


let task = URLSession.shared.dataTask(with: urlComponents.url!) {
    data, response, error in
    if let data = data {
        print(String(data: data, encoding: .utf8)!)
        PlaygroundPage.current.finishExecution()
    }
}

task.resume()
