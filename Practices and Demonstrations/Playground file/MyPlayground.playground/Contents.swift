//var a = "Hello bilibili."
//var x:[String] = []
//a.map {
//    x.append("\($0.self)")
//}
//
//print(x)
struct TD {
    var a: Int
    var b: String
    
    init? (a: Int, b: String) {
        if a > 10 {
            return nil
        } else {
            self.a = a
            self.b = b
        }
    }
}

var x = TD(a: 12, b: "12")
var y = TD(a: 1, b: "12")
print(x)
print(y)
