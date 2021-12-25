//
//  ContentView.swift
//  SwiftUITutorial
//
//  Created by Wayne on 2021/7/19.
//

import SwiftUI

struct MyView: View {
    
    @State private var name: String =  "123"
    
    var body: some View {
        VStack {
            Text("测试")
                .font(.largeTitle)
                .foregroundColor(.red)
                .border(Color.purple)
            Text(name)
                .frame(width: 100)
                .background(Color.red)
            Text(name)
                .background(Color.red)
                .frame(width: 100)
            Text("第四行")
//                .padding()  // 会报错 因为返回普通View 然而bold只能作用于Text
                .bold()
        }
        .font(.title)
        .foregroundColor(Color.gray)
        
    }
}

struct ContentView: View {
    var body: some View {
        MyView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
            .environment(\.locale, .init(identifier: "zh"))
    }
}

// 尽量不要在 视图和控件 里进行 数据处理


/*
 
    视图 控件 修饰器 链式调用 先后顺序
    父视图 自视图 层级 就近原则
 
 
 */
