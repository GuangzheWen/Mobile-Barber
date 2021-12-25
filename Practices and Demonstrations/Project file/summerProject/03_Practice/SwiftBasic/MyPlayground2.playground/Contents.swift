//import UIKit
//
//var greeting = "Hello, playground"
//print(greeting)
//
//var myString:String?
//
//myString = "Hello, Swift!"
//
//if myString != nil {
//   print(myString!)
//}else{
//   print("myString 值为 nil")
//}
//
//for _ in 1...1 {
//    print("123")
//}
//print(1 << 3 + 2 & 7)
//print(3 + 2)
//print(1 << 5)
//print(32 & 7)
//print((1 << (3 + 2))&7)
//
//var index = 5
//
//switch index {
//   case 100  :
//      print( "index 的值为 100")
//      fallthrough
//   case 10,15  :
//      print( "index 的值为 10 或 15")
//      //fallthrough
//   case 5  :
//      print( "index 的值为 5")
//    fallthrough
//case 50  :
//   print( "index 的值为 5")
//    fallthrough
//   default :
//      print( "默认 case")
//}
//var someInts = [Int](repeating: 10, count: 3)
//print(someInts.count)
//someInts.append(20)
//someInts.append(30)
//someInts += [40]
//print(someInts.count)
//print(someInts.capacity)
//someInts += [40]
//print(someInts.count)
//print(someInts.capacity)
//someInts += [40]
//print(someInts.count)
//print(someInts.capacity)
//
//
//var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
//
//var someVar = someDict[1]
//
//print( "key = 1 的值为 \(someVar!)" )
//print( "key = 2 的值为 \(someDict[2])" )
//print( "key = 3 的值为 \(someDict[3])" )
//var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
//
//var oldVal = someDict.updateValue("One 新的值", forKey: 4)
//
//var someVar = someDict[1]
//
//print( "key = 1 旧的值 \(oldVal)" )
//print( "key = 1 的值为 \(someVar)" )
//print( "key = 2 的值为 \(someDict[2])" )
//print( "key = 3 的值为 \(someDict[3])" )
//var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
//
//let dictKeys = [Int](someDict.keys)
//let dictValues = someDict.values
//
//print("输出字典的键(key)")
//
//for (key) in dictKeys {
//    print("\(key)")
//}
//
//print("输出字典的值(value)")
//
//for (value) in dictValues {
//    print("\(value)")
//}
//
//func runoob(site: String) -> String {
//    return (site)
//}
//func runoob() -> String {
//    return ("site")
//}
//print(runoob(site: "www.runoob.com"))
//print(runoob())

//
//func minMax(array: [Int]) -> (min: Int, max: Int) {
//    var currentMin = array[0]
//    var currentMax = array[0]
//    for value in array[1..<array.count] {
//        if value < currentMin {
//            currentMin = value
//        } else if value > currentMax {
//            currentMax = value
//        }
//    }
//    return (currentMin, currentMax)
//}
//
//let bounds = minMax(array: [8, -6, 2, 109, 3, 71]).min
//print(bounds)
// print("最小值为 \(bounds.min) ，最大值为 \(bounds.max)")
//func vari<N>(members: N...){
//    for i in members {
//        print(i)
//    }
//}
//vari(members: 4,3,5)
//vari(members: 4.5, 3.1, 5.6)
//vari(members: "Google", "Baidu", "Runoob")
//func vari<N>(members: N){
//    print(members)
//}
//vari(members: 4)
//vari(members: 4.5)
//vari(members: "Googlb")

//func q(_ a: inout Int, _ b: inout Int) {
//    a = 3
//    b = 4
//    print(a, b)
//}
//var x = 1
//var y = 2
//q(&x, &y)
//print(x, y)
//func calcDecrement(forDecrement total: Int) -> () -> Int {
//   var overallDecrement = 0
//   func decrementer() -> Int {
//      overallDecrement -= total
//      return overallDecrement
//   }
//   return decrementer
//}
//let decrem = calcDecrement(forDecrement: 30)
//print(decrem())
//
//print(decrem())
//let names = ["AT", "AE", "D", "S", "BE"]
//
//// 使用普通函数(或内嵌函数)提供排序功能,闭包函数类型需为(String, String) -> Bool。
//func backwards(s1: String, s2: String) -> Bool {
//    return s1 > s2
//}
//var reversed = names.sorted(by: {
//    (s1: String, s2: String) -> Bool in
//    return s1 > s2
//})
//var reversed = names.sorted(by: > )
//
//print(reversed)
//class Classname {
//   static var computedTypeProperty: Int {
//      // 这里返回一个 Int 值
//    return 1
//   }
//}
//
//print(Classname.computedTypeProperty)
//class HTMLElement {
//
//    let name: String
//    let text: String?
//
//    lazy var asHTML: () -> String = {
//        if let text = self.text {
//            return "<\(self.name)>\(text)</\(self.name)>"
//        } else {
//            return "<\(self.name) />"
//        }
//    }
//
//    init(name: String, text: String? = nil) {
//        self.name = name
//        self.text = text
//    }
//
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//
//}
//
//// 创建实例并打印信息
//var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
//print(paragraph!.asHTML())
//
//class HTMLElement {
//
//    let name: String
//    let text: String?
//
//    lazy var asHTML: () -> String = {
//        [unowned self] in
//        if let text = self.text {
//            return "<\(self.name)>\(text)</\(self.name)>"
//        } else {
//            return "<\(self.name) />"
//        }
//    }
//
//    init(name: String, text: String? = nil) {
//        self.name = name
//        self.text = text
//    }
//
//    deinit {
//        print("\(name) 被析构")
//    }
//
//}
//
////创建并打印HTMLElement实例
//var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
//print(paragraph!.asHTML())
//
//// HTMLElement实例将会被销毁，并能看到它的析构函数打印出的消息
//paragraph = nil
//
//class mySubjects {
//    var physics: String
//    init(physics: String) {
//        self.physics = physics
//    }
//}
//
//class Chemistry: mySubjects {
//    var equations: String
//    init(physics: String, equations: String) {
//        self.equations = equations
//        super.init(physics: physics)
//    }
//}
//
//class Maths: mySubjects {
//    var formulae: String
//    init(physics: String, formulae: String) {
//        self.formulae = formulae
//        super.init(physics: physics)
//    }
//}
//
//let sa = [
//    Chemistry(physics: "固体物理", equations: "赫兹"),
//    Maths(physics: "流体动力学", formulae: "千兆赫"),
//    Chemistry(physics: "热物理学", equations: "分贝"),
//    Maths(physics: "天体物理学", formulae: "兆赫"),
//    Maths(physics: "微分方程", formulae: "余弦级数")]
//
//
//let samplechem = Chemistry(physics: "固体物理", equations: "赫兹")
//print("实例物理学是: \(samplechem.physics)")
//print("实例方程式: \(samplechem.equations)")
//
//
//let samplemaths = Maths(physics: "流体动力学", formulae: "千兆赫")
//print("实例物理学是: \(samplemaths.physics)")
//print("实例公式是: \(samplemaths.formulae)")
//
//var chemCount = 0
//var mathsCount = 0
//for item in sa {
//    // 如果是一个 Chemistry 类型的实例，返回 true，相反返回 false。
//    if item is mySubjects {
//        chemCount += 1
//    }
//}
//
//print("化学科目包含 \(chemCount) 个主题，数学包含 \(mathsCount) 个主题")
//struct sum {
//    var num1 = 100, num2 = 200
//}
//
//struct diff {
//    var no1 = 200, no2 = 100
//}
//
//struct mult {
//    var a = sum()
//    var b = sum()
//}
//
//
//extension mult {
//    init(x: sum, y: sum) {
//        //_ = x.num1 + x.num2
//        //_ = y.no1 + y.no2
//    }
//}
//
//
//let a = sum(num1: 100, num2: 200)
//let b = sum(num1: 200, num2: 100)
//
//let getMult = mult(x: a, y: b)
//print("getMult sum\(getMult.a.num1), \(getMult.a.num2)")
//print("getMult diff\(getMult.b.num1), \(getMult.b.num2)")
//protocol HasArea {
//    var area: Double { get }
//}
//
//// 定义了Circle类，都遵循了HasArea协议
//class Circle: HasArea {
//    let pi = 3.1415927
//    var radius: Double
//    var area: Double { return pi * radius * radius }
//    init(radius: Double) { self.radius = radius }
//}
//
//// 定义了Country类，都遵循了HasArea协议
//class Country: HasArea {
//    var area: Double
//    init(area: Double) { self.area = area }
//}
//
//// Animal是一个没有实现HasArea协议的类
//class Animal {
//    var legs: Int
//    init(legs: Int) { self.legs = legs }
//}
//
//let objects: [AnyObject] = [
//    Circle(radius: 2.0),
//    Country(area: 243_610),
//    Animal(legs: 4)
//]
//
//for object in objects {
//    // 对迭代出的每一个元素进行检查，看它是否遵循了HasArea协议
//    if let objectWithArea = object as? HasArea {
//        print("面积为 \(objectWithArea.area)")
//    } else {
//        print("没有面积")
//    }
//}
//let strings = ["google", "weibo", "taobao", "runoob", "facebook"]
//print(strings.enumerated())
//func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
//    for (index, value) in array.enumerated() {
//        if value == valueToFind {
//            // 找到返回索引值
//            return index
//        }
//    }
//    return nil
//}
//
//
//let strings = ["google", "weibo", "taobao", "runoob", "facebook"]
//if let foundIndex = findIndex(ofString: "runoob", in: strings) {
//    print("runoob 的索引为 \(foundIndex)")
//}
//func iTunesURL(searchText: String) -> URL {
//  let encodedText = searchText.addingPercentEncoding(
//      withAllowedCharacters: CharacterSet.urlQueryAllowed)!  // Add this
//  let urlString = String(
//    format: "https://itunes.apple.com/search?term=%@",
//    encodedText)                                             // Change this
//  let url = URL(string: urlString)
//  return url!
//}

//print((UInt64)(1 << 100))
//var welcomeMessage: String?
//welcomeMessage = "123"
//print(welcomeMessage!)
//welcomeMessage = ""
//print(welcomeMessage!)
//welcomeMessage = "3"
//print(welcomeMessage!)
//welcomeMessage = nil
//print(welcomeMessage)
//welcomeMessage = "123"
//print(welcomeMessage!)
//let minValue: Int = Int(UInt8.min)
//print(type(of: minValue))
//print(0x1pA)
//let a: Int
//a = 9
//print(a, terminator: "")
//let optionalSquare: Int? = 9
//let sideLength = optionalSquare?.bitWidth
//print(sideLength)
//enum Rank: Double {
//    case ace = 1
//    case two, three, four, five, six, seven, eight, nine, ten
//    case jack, queen, king
//
//    func simpleDescription() -> String {
//        switch self {
//        case .ace:
//            return "ace"
//        case .jack:
//            return "jack"
//        case .queen:
//            return "queen"
//        case .king:
//            return "king"
//        default:
//            return String(self.rawValue)
//        }
//    }
//}
//let ace = Rank.ace
//let aceRawValue = ace.rawValue
//print(aceRawValue)
//print(ace)
//enum Suit {
//    case spades, hearts, diamonds, clubs
//
//    func simpleDescription() -> String {
//        switch self {
//        case .spades:
//            return "spades"
//        case .hearts:
//            return "hearts"
//        case .diamonds:
//            return "diamonds"
//        case .clubs:
//            return "clubs"
//        }
//    }
//}
//let hearts = Suit.hearts
//let heartsDescription = hearts.simpleDescription()
//print(hearts)
//func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
//    where T.Element: Equatable, T.Element == U.Element
//{
//    print(lhs.Element)
//    for lhsItem in lhs {
//        for rhsItem in rhs {
//            if lhsItem == rhsItem {
//                return true
//            }
//        }
//    }
//    return false
//}
//print(anyCommonElements([1, 2, 3], [3]))
