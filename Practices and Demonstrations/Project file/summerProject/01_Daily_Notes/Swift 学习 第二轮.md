# Swift 学习 第二轮

视图 view

控件 control

容器 层级关系

修饰器 锦上添花

最根的协议 protocol View 必须遵循此协议

且其中有body必须实现

可以在一个xxview文件中写两个struct

如：

```swift
struct MyView: View {
	var body: some View {
    Text("123")
  }
}
struct ViewTutorial: View {
  var body: some View {
    MyView()
  }
}
```

其中some是透明类型 但不是可变类型

注意理解some any英文本意



body 的返回类型 必须是一个控件 或一个组 该组最大承载量为10个控件

VStack HStack

否则 应该使用 列表视图



@State监控重新渲染

尽量不要在 自定义视图init方法里做不必要的计算等 拖垮性能



修饰器：

modifier

支持 链式调用

```swift
Text("123")
	.font(.largeTitle)
	.foregroundColor(.red)
	.border(Color.purple)
// 注意 ！！ 是有先后顺序的
.frame(width:100)
.background(Color.red)


.background(Color.red)
.frame(width:100)

// 支持 在 父视图 全局增加修饰器 且 子视图修饰器优先级更高
// but只能 使用 定义在 view 上默认的 modifier 
// 有一些在 特定类型 上指定的 修饰器 不能 在父类 全局设定
// 如：
.padding()
.bold()
// 就会报错 因为 padding 返回 view 但是 bold 只能修饰 text
```



# Text 控件

基本使用basic

```swift
Text("abc")

Text(str)



.foregroundColor(.red)

.font(.title)

.italic()

.bold()

自定义字体：
1. 拖拽进project
2. inf.plist 里配置 Fonts provided by app 数组

Text()
	.font(.system(size: 30, weight: .light, design: serif))
	.font(.custom("自定义字体名称", size: 30))
```

文本自适应：

```swift
Text("123 123 123 123 123 123 123 123 ")
.frame(width: 100)
.lineLimit(2)
.allowsTightening(true) // 可否讲究挤一挤 要么截断
.minimumScaleFactor(0.5) // 不管多么挤 缩小倍率显示
.truncationMode(.head) // .middle .tail 哪里截断 显示为 ...

```

格式化显示：

货币 日期

```swift
let price = 100.13241
let startDate = Date(timeIntervalSinceNow: -3600)

Text("\(price, specifier: "%.2f")")
Text(startDate, style: .time)
Text(startDate, style: .date)
Text(startDate, style: .relative)
Text(startDate, style: .offset)
Text(startDate, style: .timer)
Text(startDate...Date())
Text( DateInterval(start: startDate, duration: 300) )
```



其他样式：

```swift
.strikethrough(true, color: .red) // 删除线
.underline(true, color: red)

.kerning(-3)
.kerning(3) // 字符间距

.tracking(-3)

.baselineOffset(-10) // 文字上下偏移

.textCase(.upperCase)

.frame(width: 10, height: 200, alignment: .leading)
.lineSpacing(20) // 行间距
.background(Color.red)

multilineTextAlignment(.center) // 对齐方式

.flipsForRightToLeftLayoutDirection(true) // 从右往左
.environment(\.layoutDirection, .rightToLeft)
```

不如UIKit 富文本

 但 可以 在 Text  和 Text 之间使用 + 号 拼凑不同





本地化：

```swift
Text("pencil") //  显示该语料对应 国家的语言 
Text(verbatim: "pencil") // 永远显示 pencil
Text(LocalizedStringKey("pencil")) // 显示指定 地区的语言

但是要配置：
1. Localizations 添加语言
2. 然后再 在iOS文件夹下 添加 Localizable.strings

指定语言环境语法：
TextTutorial()
	.environment(\.locale, init(identifier: "zh"))
```



# Button 控件

```swift
Button(action: {
  signIn()
},label:{
  Text("123")
})

Button(action: signIn) {
  Text("123")
}

Button("123") {
  sinIn()
}

Button("123", action: signIn)





List {
  ForEach(items) { item in
     Text(item.title)
     Button("Add item", action: addItem)             
  }
}

@State item
func addItem () {
  
}


.buttonStyle(PlainButtonStyle())
BorderlessButtonStyle()
DefaultButtonStyle()

// macOS
LinkButtonStyle()
BorderedButtonStyle()

// tvOS
CardButtonStyle()

// 自定义样式
// ButtonStyle 协议 
.scaleEffect(configuration.isPressed ? 0.9 : 1.0)
// PrimitiveButtonStyle 协议
```





# Textfield 控件

让用户输入文本的控件

```swift
@State private var email: String = ""
@State private var isEditing = false

var basicUsage: some View {
  
}
```

