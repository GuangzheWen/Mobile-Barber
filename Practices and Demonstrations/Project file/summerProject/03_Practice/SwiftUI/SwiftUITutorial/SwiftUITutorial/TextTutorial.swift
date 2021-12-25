//
//  TextTutorial.swift
//  SwiftUITutorial
//
//  Created by Wayne on 2021/7/19.
//

import SwiftUI

struct TextTutorial: View {
    
    
    var body: some View {
//        basic
//        TextFit
//        formatDisplay
//        combineText
        localizedString
    }
    
    
    var basic: some View {
        VStack {
            Text("qwer")
            Text("qwer")
                .foregroundColor(.blue)
            Text("qwer")
                .font(.title)
            Text("qwer")
                .font(.title)
                .italic()
                .bold()
        }
    }
    
    
    // 自定义字体
    var customFont: some View {
        VStack {
            Text("123")
                .font(.system(size: 30, weight: .light, design: .serif))
            Text("123")
                .font(.system(size: 40, weight: .heavy, design: .monospaced))
            Text("123")
//                .font(customFont("name"), size: 30)
        }
    }
    
    
    // 自适应字体
    @State private var myTextField = ""
    var TextFit: some View {
        VStack {
            Text("123 12  asdf  asdf adsf adsf ")
                .frame(width: 100)
            Text("123 12  asdf  asdf adsf adsf ")
                .frame(width: 100)
                .lineLimit(1)
            
            Text("123 12  asdf  asdf ad12111")
                .font(.body)
                .frame(width: 200, height: 50, alignment: .leading)
                .lineLimit(1)
                .allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            
            Text("123 12  asdf  asdf ad12111")
                .font(.body)
                .frame(width: 200, height: 50, alignment: .leading)
                .lineLimit(1)
                .allowsTightening(false)
            
            
            HStack {
                Text("this is a wide text element")
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                TextField("123", text: $myTextField)
            }
            
            VStack {
                Text("123412312 145 234236 3456735756785486579  623453453245")
                    .frame(width: 55, height: 55)
                    .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                
                Text("123412312 145 234236 3456735756785486579  623453453245")
                    .frame(width: 55, height: 55)
                    .truncationMode(.middle)
                
                Text("123412312 145 234236 3456735756785486579  623453453245")
                    .frame(width: 55, height: 55)
                    .truncationMode(.head)
            }
            
        }
    }
    
    // 格式hua显示
    let price = 100.2345
    let startDate = Date(timeIntervalSinceNow: -3600)
    var formatDisplay: some View {
        VStack {
            Text("$ \(price, specifier: "%.2f")")
            Text(startDate, style: .time)
            Text(startDate, style: .date)
            Text(startDate, style: .relative)
            Text(startDate, style: .offset)
            Text(startDate, style: .timer)
            Text(startDate...Date())
            Text(DateInterval(start: startDate, duration: 300))
        }
    }
    
    
    // 其他显示
    var other: some View {
        VStack {
            Text("qwer")
                .font(.largeTitle)
                .strikethrough(true, color: .red)
            Text("qwer")
                .font(.largeTitle)
                .underline(true, color: .red)
            
            VStack{
                VStack(alignment: .leading) {
                    Text("1234")
                        .kerning(-3)
                    Text("1234")
                        .kerning(0)
                    Text("1234")
                        .kerning(3)
                }
                VStack (alignment: .leading)  {
                    Text("1234")
                        .tracking(-3)
                    Text("1234")
                    Text("1234")
                        .tracking(3)
                }

            }
            .background(Color(white: 0.9))
            
            Text("sdfghjkGHJ")
                .textCase(.uppercase)
            
            HStack(alignment: .top) {
                Text("Hello")
                    .baselineOffset(10)
                    .border(Color.black)
                Text("Hello")
                    .border(Color.black)
                    .background(Color.red)
                Text("Hello")
                    .baselineOffset(-10)
                    .border(Color.black)
            }
            
            VStack {
                Text("""
                    1234 2345 sdfg 3456 23452123456 234 3452 6543 234 2345 134 123
                    1345234
                     123 123r 12 345fgsdfa dfqwerwteyew rdgsfasfghjdh sgdhfj sgfs adfshg
                    """)
                    .frame(width: 200, height: 200, alignment: .leading)
                    .lineSpacing(10.0)
                    .background(Color.blue)
                Text("""
                    1234 2345 sdfg 3456 23452123456 234 3452 6543 234 2345 134 123
                    1345234
                     123 123r 12 345fgsdfa df
                    """)
                    .frame(width: 200, height: 200, alignment: .trailing)
                    .multilineTextAlignment(.center)
            }
            
            Text("Hello world")
                .flipsForRightToLeftLayoutDirection(true)
                .environment(\.layoutDirection, .rightToLeft)
            
            
        }
    }
    
    
    // 复合文本
    var combineText: some View {
        
            Text("qwe")
                .foregroundColor(.blue)
            +
            Text("1234")
        
    }
    
    
    
    // 本地化
    var localizedString: some View {
        VStack{
            Text("pencil")
            Text(verbatim: "pencil")
//            Text(LocalizedStringKey("pencil"))
        }
    }
}

struct TextTutorial_Previews: PreviewProvider {
    static var previews: some View {
        TextTutorial()
            .previewDevice("iPhone X")
            .environment(\.locale, .init(identifier: "zh"))
    }
}
