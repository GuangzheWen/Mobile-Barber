// 协议 -> 类 结构 枚举 中都可以用
protocol Tax {
    var national: Double { get }
    var states: Double { get set }
    var individual: Double { get set }
    mutating func changeTax(newTax: Double)
    
}

class Ohio: Tax {
//    func changeTax(newTax: Double) {
//        states  = newTax
//    }
    
    var national: Double = 0.25
    
    var states: Double = 0.03
    
    var individual: Double = 0.1
    
    
}

protocol Donate {
    var donateRate: Double { get }
}

var a = Ohio()
print(a.national)
print(a.individual)
print(a.states)

struct Taxas: Tax, Donate {
    var donateRate: Double
    
    // 在struct中方法修改属性值需要mutating
//    mutating func changeTax(newTax: Double) {
//        states = newTax
//    }
    
    var national: Double
    
    var states: Double
        
    var individual: Double
    
    func changesth()  {
        print("1")
    }
    mutating func changesth2() {
        national = 9
    }
    
    
}

var b = Taxas(donateRate: 1, national: 1, states: 1, individual: 1)
print(b.national, b.individual, b.states)

// 补充协议：强制遵守也

extension Tax {
    mutating func  changeTax(newTax: Double) {
        states = newTax
    }
}
