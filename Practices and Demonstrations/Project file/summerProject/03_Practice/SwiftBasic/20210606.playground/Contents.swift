      enum Country {
        case Shu
        case Wei
        case Wu
        case Qun
        
        func cof() -> Double {
            switch self {
            case .Wei:
                return 2
            case .Shu:
                return 1.5
            case .Wu:
                return 1
            case .Qun:
                return 0.5
            }
        }
      }

      enum Type {
        case CiKe
        case FaShi
        case TanKe
        case ZhanShi
        case SheShou
        
        func damage() -> Double {
          switch self {
            case .FaShi: return 20
            case .ZhanShi: return 20
            case .SheShou: return 32
            case .TanKe: return 16
            case .CiKe: return 40
          }
        }
        
        func blood() -> Double {
          switch self {
            case .FaShi: return 800
            case .ZhanShi: return 1000
            case .SheShou: return 700
            case .TanKe: return 1400
            case .CiKe: return 6000
          }
        }
      }

struct Card {
  var country: Country
  var type: Type
    var blood: Double {
        willSet {
            print("original blood \(blood)")
        }
        didSet {
            print("current blood \(blood)")
        }
    }
  
  init(country: Country, type: Type) {
    self.country = country
    self.type = type
    blood = type.blood()
  }
}

// 结构体和类的区别：有无构造器
// 类：引用类型
// 结构：值类型，不能继承

var card1 = Card(country: .Shu, type: .ZhanShi)
print(card1.country)
print(card1.type)
print(card1.blood)
            
            
var card2 = Card(country: .Wu, type: .SheShou)
// wei shu wu qun

func computeDamage(card: Card) -> Double {
    return card.country.cof() * card.type.damage()
}

var round = 1
  while card1.blood > 0 && card2.blood > 0 {
    print("Round \(round)")
    print("card1")
    card1.blood -= computeDamage(card: card2)
    print("card2")
    card2.blood -= computeDamage(card: card1)
    
    round += 1
  }
  
  if card1.blood <= 0 {
    print("card 2 win")
  } else if card2.blood <= 0 {
    print("card 1 win ")
  }
