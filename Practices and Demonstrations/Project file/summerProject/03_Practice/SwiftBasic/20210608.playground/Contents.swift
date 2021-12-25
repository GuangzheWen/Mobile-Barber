//import UIKit
//
//var greeting = "Hello, playground"

// 异常处理 shi使用协议protocolError like exception in java
enum PrinterError: Error {
    // 如果 do catch 接空，则直接打印case值
    // 如果 do catch let myError as myError 再myError.myFuncError 可以自定义报错信息
    case outOfPaper
    case noToner
    case onFire
    case other
    
    var localizedDescription: String {
        switch self {
        case .outOfPaper:
            return "The printer is out of paper"
        case .noToner:
            return "The printer has no toner"
        case .onFire:
            return "The printer is working try again later"
        case .other:
            return "Unknown reason"
        }
    }
}


let result = ["normal", "normal", "normal", "normal", "normal", "Out of Paper", "No toner", "On the fire"]

func send(job: Int, withResult result: String) throws -> String {
    switch result {
    case "normal":
        return "Work fine"
    case "Out of Paper":
        throw PrinterError.outOfPaper
    case "No toner":
        throw PrinterError.noToner
    case "On the fire":
        throw PrinterError.onFire
    default:
        throw PrinterError.other
    }
}


do {
    let printerResponse = try send(job: 1024, withResult: "No toner")
    print(printerResponse)
} catch  {
    print(error)
}

do {
    let printerResponse = try send(job: 1024, withResult: "normal")
    print(printerResponse)
} catch  {
    print(error)
}

do {
    let printerResponse = try send(job: 1024, withResult: result.randomElement()!)
    print(printerResponse)
} catch let printerError as PrinterError {
    print(printerError.localizedDescription)
}


var __Newyork = 0
var a_as_aa_ = ""

let shoppingList = [
    "phone" : "Apple",
    "shoes" : "Nike",
    "scarf" : "Buberry",
]
// zidi字典是无序的
for (_, brand) in shoppingList {
    print(brand)
}

//for i in 5..<8 {
//    print("0")
//}

