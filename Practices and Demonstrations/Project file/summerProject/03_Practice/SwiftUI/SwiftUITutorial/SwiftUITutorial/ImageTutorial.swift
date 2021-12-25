//
//  ImageTutorial.swift
//  SwiftUITutorial
//
//  Created by Wayne on 2021/7/20.
//

import SwiftUI

struct ImageTutorial: View {
    var body: some View {
        basicUsage
    }
    
    var basicUsage: some View {
        Image("swift")
            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .aspectRatio(contentMode: .fit)
//            .scaledToFill()
            .scaledToFit()
            
    }
}

struct ImageTutorial_Previews: PreviewProvider {
    static var previews: some View {
        ImageTutorial()
    }
}
