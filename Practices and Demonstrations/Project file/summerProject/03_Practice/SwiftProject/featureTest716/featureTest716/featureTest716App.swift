//
//  featureTest716App.swift
//  featureTest716
//
//  Created by Wayne on 2021/7/16.
//

import SwiftUI

@main
struct featureTest716App: App {
    
    @State var showflag = true
    @State var customerOrBarber = true
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                        if showflag {
                            ContentView(showflag: self.$showflag, customerOrBarber: self.$customerOrBarber)
                        }
                        else {
                            if customerOrBarber {
                                HomePage()
                            }
                            else {
                                HomePage2()
                            }
                        }
                    }
        }
    }
}
