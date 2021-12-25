//
//  ContentView.swift
//  featureTest716
//
//  Created by Wayne on 2021/7/16.
//

import SwiftUI

struct ContentView: View {
    @State var pageNumber = 1
    @State var periousOffset: CGSize = CGSize(width: UIScreen.main.bounds.width, height: 0)
    @State var offset: CGSize = CGSize(width: UIScreen.main.bounds.width, height: 0)
    
    @Binding var showflag:Bool
    @Binding var customerOrBarber:Bool

    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { (value)in
                self.offset.width = self.periousOffset.width + value.translation.width
            }
            .onEnded { (value)in
                if abs(value.translation.width) < 50 {
                    self.offset.width = self.periousOffset.width
                } else {
                    if value.translation.width > 0 && self.pageNumber > 1 {
                        periousOffset.width += UIScreen.main.bounds.width
                        pageNumber -= 1
                        offset.width = periousOffset.width
                    } else if value.translation.width < 0 && pageNumber < 3 {
                        periousOffset.width -= UIScreen.main.bounds.width
                        pageNumber += 1
                        offset.width = periousOffset.width
                    } else {
                        offset.width = periousOffset.width
                    }
                }
            }
            return VStack(alignment: .center, spacing:nil, content: {
                HStack {
                    PageView(title: "Welcome page")
                    PageView(title: "Welcome page2")
                    PageView(title: "Welcome page3")
                }
                .offset(x: offset.width, y: 0)
                .gesture(dragGesture)
                .animation(.interpolatingSpring(stiffness: 100, damping: 10))
                VStack {
                    PageIndicator(pageNumber: $pageNumber)
                    HStack {
                        Spacer()
                        Button(action: {
                            if pageNumber == 3 {
                                
                                self.showflag.toggle()
                                self.customerOrBarber = true
                                
                            }else{
                                periousOffset.width -= UIScreen.main.bounds.width
                                pageNumber += 1
                                offset.width = periousOffset.width
                            }
                        }) {
                            Text(pageNumber == 3 ? "Customer" : "Skip")
                            .foregroundColor(pageNumber == 3 ? .white : .orange)
                            .multilineTextAlignment(.trailing)
                                // UIScreen.main.bounds.width / 3
                            .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(pageNumber == 3 ? Color.orange : Color.white)
                            .font(.system(size: 16))
                            .cornerRadius(25)
                            .animation(.easeIn)
                        }
                        
                        if pageNumber == 3 {
//                            Spacer()
                            Button(action: {
                                self.showflag.toggle()
                                self.customerOrBarber = false
                            }){
                                Text("Barber")
                                    .foregroundColor(pageNumber == 3 ? .white : .orange)
                                    .multilineTextAlignment(.trailing)
                                    .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .background(pageNumber == 3 ? Color.orange : Color.white)
                                    .font(.system(size: 16))
                                    .cornerRadius(25)
                                    .animation(.easeIn)
                                
                            }
                        }
                        Spacer()
                    }
                }
                .padding(.bottom, 20)
            })
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(showflag: .constant(true), customerOrBarber: .constant(true))
    }
}

