//import UIKit
//
//var greeting = "Hello, playground"
//print(greeting)
//
import UIKit

class Pet {
    // 属性
    var sex: Int
    var color: UIColor
    var rarity: String
    
    // 构造器
    init(sex: Int, color: UIColor, rarity: String) {
        self.sex = sex
        self.color = color
        self.rarity = rarity
    }
    
    // 类里面的函数称为：方法
    func makeMoney() -> Int  {
        return 20
    }
}

class Cat: Pet {
    // 继承全部属性from Pet Class
    
    // 属性
    var clothes: [String]
    
    // 构造器
    init(sex: Int, color: UIColor, rarity: String, clothes: [String]) {
        self.clothes = clothes
        // 调用父类初始化函数
        super.init(sex: sex, color: color, rarity: rarity)
    }
    
    override func makeMoney() -> Int {
        switch rarity {
        case "Legend":
            return 200
        case "Rare":
            return 100
        case "Normal":
            return 1
        default:
            return 0
        }
    }
    
}

// 实例
var kitty = Cat(sex: 1, color: .orange, rarity: "Legend", clothes: ["Hat", "Shirt"])

var kittyMoney = 0 {
    willSet {
        print("Original money : \(kittyMoney)")
    } didSet {
        print("Current money : \(kittyMoney)")
    }
}

kittyMoney += kitty.makeMoney()
kittyMoney += kitty.makeMoney()
// willset and didset

// print(kitty.makeMoney())
