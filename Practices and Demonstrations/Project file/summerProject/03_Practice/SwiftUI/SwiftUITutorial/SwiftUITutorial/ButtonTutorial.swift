//
//  ButtonTutorial.swift
//  SwiftUITutorial
//
//  Created by Wayne on 2021/7/20.
//

import SwiftUI

struct ButtonTutorial: View {
    var body: some View {
//        basicUsage
//        addToContainers
//        styleButtonsiOS
        customButtonStyle
    }
    
    
    // 基本用法
    var basicUsage: some View {
        VStack (spacing: 20) {
            Button(action: {
                signIn()
            }, label: {
                Text("Button 1")
            })
            Button(action: signIn) {
                Text("Button 2")
            }
            Button("Button 3") {
                register()
            }
            Button("Button 4", action: register)
        }
    }
    
    private func signIn() {
        print("13234")
    }
    
    private func register() {
    
    }
    
    // 配合列表
    var addToContainers: some View {
        List {
            ForEach(items){ item in
                Text(item.title)
            }
            Button("add item", action: addItem)
        }
    }
    
    struct Item: Identifiable {
        let id = UUID()
        let title: String
        let desc: String
    }
    @State private var items: [Item] = []
    
    private func addItem() {
        let newItem = Item(title: "String", desc: "new line ")
        items.append(newItem)
    }
    
    // 样式
    var styleButtonsiOS: some View {
        VStack(spacing: 20) {
            Button("Sign in", action: signIn)
                .buttonStyle(PlainButtonStyle())
            Button("Sign in", action: signIn)
                .buttonStyle(BorderlessButtonStyle())
            Button("Sign in", action: signIn)
                .buttonStyle(DefaultButtonStyle())
        }
    }
    
    
    var styleButtonMacOS: some View {
        VStack(spacing: 20) {
            Button("Sign in", action: signIn)
                .buttonStyle(PlainButtonStyle())
            Button("Sign in", action: signIn)
                .buttonStyle(BorderlessButtonStyle())
            Button("Sign in", action: signIn)
                .buttonStyle(DefaultButtonStyle())
            #if os(macOS)
                Button("Sign in", action: signIn)
                .buttonStyle(LinkButtonStyle())
            Button("Sign in", action: signIn)
            .buttonStyle(BorderedButtonStyl())
            
            #elseif os(tvOS)
            Button("Sign in", action: signIn)
                .buttonStyle(CardButtonStyle())
            #endif
        }
    }
    
    // 自定义
    var customButtonStyle: some View {
        VStack(spacing: 20) {
            Button("1234r", action: signIn)
                .buttonStyle(ScaleButtonStyle())
            Button("1234r", action: signIn)
                .buttonStyle(RedBorderedButtonStyle())
            Button("1234r", action: signIn)
                .buttonStyle(ScaleButtonStyle())
                .buttonStyle(RedBorderedButtonStyle())
            Button("1234r", action: signIn)
                .buttonStyle(RedBorderedButtonStyle())
                .buttonStyle(ScaleButtonStyle())
            Button("1234r", action: signIn)
                .buttonStyle(LongPressButtonStyle())
            Button("1234r", action: signIn)
                .buttonStyle(ComposeButtonStyle())
        }
    }
    struct ScaleButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            HStack {
                Spacer()
                configuration.label
                    .padding()
                    .foregroundColor(configuration.isPressed ? .red : .white)
                Spacer()
            }
            .frame(width: 300)
            .background(Color.blue.cornerRadius(3.0))
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
        }
    }
    
    struct RedBorderedButtonStyle: PrimitiveButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            Button(configuration)
                .border(Color.red, width:2)
        }
    }
    struct LongPressButtonStyle: PrimitiveButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            Button(configuration)
                .gesture(
                LongPressGesture()
                    .onEnded { _ in
                        configuration.trigger()
                    }
                )
        }
    }
    struct ComposeButtonStyle: PrimitiveButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            Button(configuration)
                .buttonStyle(LongPressButtonStyle())
                .buttonStyle(ScaleButtonStyle())
                .buttonStyle(RedBorderedButtonStyle())
        }
    }
    
    
}

struct ButtonTutorial_Previews: PreviewProvider {
    static var previews: some View {
        ButtonTutorial()
    }
}
