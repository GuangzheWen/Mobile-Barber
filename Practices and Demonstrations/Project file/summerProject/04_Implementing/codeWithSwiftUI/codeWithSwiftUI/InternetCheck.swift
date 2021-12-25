//
//  InternetCheck.swift
//  codeWithSwiftUI
//
//  Created by Wayne on 2021/7/2.
//

import SwiftUI

struct InternetCheck: View {
    var body: some View {
        VStack {
            Text("Disconnected Internet")
                .fontWeight(.heavy)
            Text(" ")
            Button(action: {
                codeWithSwiftUIApp.internetCheck = true

                
            }, label: {
                Text("Fixed")
            })
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .accentColor(.green)
        }
        

    }

}

struct InternetCheck_Previews: PreviewProvider {
    static var previews: some View {
        InternetCheck()
    }
}
