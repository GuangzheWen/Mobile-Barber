// import UIKit
// variables constant data

// First sentence of Swift
var greeting = "Hello, playground"
print(greeting)

print("Hello world!")



// 整型
let integerVariable : Int
//print(integerVariable) 未初始化
integerVariable = 1
//integerVariable = 1.0 整形
print(integerVariable)
//integerVariable = 2 常量
print(integerVariable)
var a : Int = 0
print(a)
//a = nil 不可以
print(a)



// 字符型
var charVariable : Character
charVariable = "a"
//charVariable = 'a' 双引号
//charVariable = "aa" 单字符
charVariable = "一" // 中文可以
print(charVariable)
//charVariable = nil bky



// boolean
var booleanVariable : Bool = false
print(booleanVariable)
//booleanVariable = 0 非0/1 是true false
booleanVariable = true
print(booleanVariable)
//booleanVariable = nil 不可以




// 浮点型
var floatVariable : Float = 1.2
print(floatVariable)
var doubleVariable : Double = 1.3
print(doubleVariable)
var v = Float(doubleVariable) + floatVariable
var v2 = doubleVariable + Double(floatVariable)
print(v)
print(type(of: v))
print(v2)
print(type(of: v2))
//floatVariable = nil 不可以



// 字符串
var stringVariable : String =  ""
var p : String = "23"
print(stringVariable)
stringVariable = "1"
print(stringVariable)
//stringVariable = nil 不可以
print(stringVariable)
print(stringVariable,p)
print(stringVariable+p)
var plus : String = stringVariable + p
print(a)
stringVariable.append(p)
print(stringVariable)


