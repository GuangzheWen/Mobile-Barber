import UIKit


let urlString:String = "https://i.snssdk.com/mooc/stream/api/list/"
   var url:URL!
   url = URL(string:urlString)
   //发出请求 sending request
   URLSession.shared.dataTask(with: url) { (objectData, response, error) in
       guard error == nil else {
           print("network error 网络出错:\(error!.localizedDescription)")
           return
       }
       
       guard objectData != nil else {
           print("empty data 数据为空：")
           return
       }
       
       do {
           let jsonData = try JSONSerialization.jsonObject(with: objectData!, options: .mutableContainers)
           print(jsonData)
       } catch {
           print("parsing error 解析出错")
       }
   }.resume()
