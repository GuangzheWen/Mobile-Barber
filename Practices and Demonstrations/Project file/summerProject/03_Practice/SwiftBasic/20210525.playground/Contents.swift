import UIKit

var myNumber = 12
var multiLineOutput = """
    first line
    second line
    \(myNumber)
"""

print(multiLineOutput)
print("1\n\t2\n3")

// Array
var  shoppingList = ["T-shirt", "Shoes", "Switch", "iPhone"]
print(shoppingList)
print(shoppingList[1])



// var brand = ["T-shirt": "Nike", "Shoes": "Addidas"]
var brand = [
  "T-shirt": "Nike",
  "Shoes": "Addidas"
]
print(brand)


shoppingList = []
print(shoppingList)

brand = [:]
print(brand)
var a = 0
print(a)
a+=1
print(a)

var scores = [32, 38, 24, 21, 45, -1]

var passNum = 0
var failNum = 0
var errorNum = 0

// for ... in ... loop
for score in scores{
  if score >= 32 {
    passNum += 1
  } else if score < 0{
    errorNum += 0
  }else {
    failNum += 1
  }
}

print("Pass: \(passNum)", "Fail: \(failNum)", "Error: \(errorNum)")

// Optional type package
var zhaoScore: Int? = nil
//print(zhaoScore, "1\t1")
//print("\(zhaoScore)1\t1")
print("1")
// open package

// open package with default option
var defaultScore = 0
print(zhaoScore ?? defaultScore)

if let zhaoScore = zhaoScore {
  print(zhaoScore)
}
print("1")

zhaoScore = 32
if let zhaoScore = zhaoScore {
  print(zhaoScore)
}
// open package with default option
print(zhaoScore ?? defaultScore)



// dictionary
let allScores = [
  "cs": [12,234,1234,334,34],
  "software": [12,46,234,345,34],
  "industrialDesign": [4,44,662,62,34]
]

var maxScore = 32
var minScore = 32
var str1: String = ""
var str2 = ""

//print(str1)
print(str2)


for (/* major */_, scores) in allScores {
  for score in scores {
    if maxScore < score {
      maxScore = score
//        str1 = m
    }
    if minScore > score {
      minScore = score
//        str2 = m
    }
  }
}

print("MAX: \(maxScore)", "MIN: \(minScore)")
print(str1, str2)



var totalScore = 0
var avgScore = 0
var softwareScores = [12,34,45,643,1]
var index = 0

while index < softwareScores.count {
  totalScore += softwareScores[index]
  index += 1
}
avgScore = totalScore / softwareScores.count

print(totalScore, avgScore)

var comment = ""
switch comment {
  case "distinguish":
      print("conguatulaitons")
  case "merit":
      print("good")
  case "pass":
      print("well")
  default:
      print("fail")
}
