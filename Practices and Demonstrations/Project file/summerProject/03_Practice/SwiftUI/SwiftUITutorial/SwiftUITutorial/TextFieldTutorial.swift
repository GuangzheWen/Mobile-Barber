//
//  TextFieldTutorial.swift
//  SwiftUITutorial
//
//  Created by Wayne on 2021/7/20.
//

import SwiftUI

struct TextFieldTutorial: View {
    var body: some View {
//        basicUsage
//        formatterTextField
//        modifiers
//        styleTextField
//        customStyle
        clearButton
//        placeHolderColor
    }
    
    // 基本使用方法
    @State private var email:String = ""
    @State private var isEditing:Bool = false
    var basicUsage:some View {
        VStack(spacing: 30) {
            TextField("Input your email address", text: $email) {
                isEditing in
                self.isEditing = isEditing
            } onCommit: {
                print("Your email address is: \(email)")
            }
            .autocapitalization(.none)
            .padding()
            .border(tipsBorder)
            HStack {
                Text("your email is : \(email)")
                Spacer()
            }
        }
        .padding()
        .background(
            Color.white
                .onTapGesture {
                    print("tap")
//                    endEditing()
                }
        )
    }
    var tipsBorder: some ShapeStyle {
        if isEditing {
            return validate(email) ? Color.green : Color.red
        } else {
            return Color.gray
        }
    }
    private func validate (_ email: String) -> Bool {
        return isvalid(email: email)
    }
    private func isvalid(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return predicate.evaluate(with: email)
    }
    
    
    // 格式化
    @State private var nameComponents = PersonNameComponents()
    let nameFormatter = PersonNameComponentsFormatter()
    var formatterTextField:some View {
        VStack {
            TextField("Place holder", value: $nameComponents, formatter: nameFormatter, onCommit: {
                display(components: nameComponents)
            })
            .padding()
            .disableAutocorrection(true)
            .border(Color.gray)
            Text(nameComponents.debugDescription)
            
        }
        .padding()
    }
    private func display(components: PersonNameComponents){
        print("personanamecomponentsis: \(components)")
    }
    
    
    // 修饰器
    var modifiers:some View {
        VStack {
            TextField("input your email address", text: $email)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .autocapitalization(.none) // 输入内容大小写
                .disableAutocorrection(true)
                .textCase(.none)        // 占位符大小写
//                .returnKeyType(.done)
                .accentColor(.green)
                .padding()
                .border(Color.purple)
        }
    }
    
    
    // 样式
    @State private var givenName:String = ""
    @State private var familyName:String = ""
    var styleTextField:some View {
        VStack {
            VStack {
                TextField("given name", text: $givenName)
                TextField("family name", text: $familyName)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            VStack {
                TextField("given name", text: $givenName)
                TextField("family name", text: $familyName)
            }
            .textFieldStyle(PlainTextFieldStyle())
            VStack {
                TextField("given name", text: $givenName)
                TextField("family name", text: $familyName)
            }
            .textFieldStyle(DefaultTextFieldStyle())
            #if os(macOS)
            VStack {
                VStack {
                    TextField("given name", text: $givenName)
                    TextField("family name", text: $familyName)
                }
                .textFieldStyle(SquareTextFieldStyle())
            }
            #endif
        }.padding()
        
        
        
    }
    
    
    
    // 自定义样式
    @State var searchContent:String = ""
    var customStyle:some View {
        VStack(alignment: .leading, spacing: 20){
            Text("cunstom textfield style").font(.title2)
            TextField("Searching...", text: $searchContent)
//                .textFieldStyle(OvalTextFieldStyle())
                .textFieldStyle(UnderlineTextFieldStyle())
        }.padding()
    }
    
    struct OvalTextFieldStyle:TextFieldStyle {
        func _body(configuration: TextField<Self._Label>) -> some View {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                configuration
                    .padding(.vertical, 10)
            }
            .padding(.horizontal, 10)
            .background(Color.yellow)
            .cornerRadius(20.0)
            .shadow(color: .gray, radius: 2.0)
        }
    }
    struct UnderlineTextFieldStyle:TextFieldStyle {
        func _body(configuration: TextField<Self._Label>) -> some View {
            
            configuration
                .overlay(
                    Rectangle()
                        .frame(height:1)
                        .padding(.top, 35)
                )
                .foregroundColor(.pink)
                .padding(10)
            
        }
    }

    
    // 补充
    var clearButton:some View {
        VStack{
            TextField("123", text: $email)
                .autocapitalization(.none)
                .textFieldStyle(TextFieldClearButtonStyle(text: $email))
        }
    }
    struct TextFieldClearButtonStyle:TextFieldStyle {
        @Binding var text: String
        
        func _body(configuration: TextField<Self._Label>) -> some View{
            HStack {
                configuration
                    .padding()
                if !text.isEmpty {
                    Button(action:{
                        self.text = ""
                    }, label:{
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    })
                    .padding(.trailing, 10)
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding(.horizontal, 10)
        }
    }
    
//    var placeHolderColor:some View {
//
//    }
        
}

struct TextFieldTutorial_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldTutorial()
    }
}
