//
//  PageIndicator.swift
//  featureTest716
//
//  Created by Wayne on 2021/7/16.
//

import SwiftUI

struct PageIndicator: View {
    
    @Binding var pageNumber : Int
    
    var body: some View {
        HStack {
        Circle()
        .frame(width: 10, height: 10)
        .foregroundColor(pageNumber == 1 ? .orange : .gray)
        Circle()
        .frame(width: 10, height: 10)
        .foregroundColor(pageNumber == 2 ? .orange : .gray)
        Circle()
        .frame(width: 10, height: 10)
        .foregroundColor(pageNumber == 3 ? .orange : .gray)

        }
        .padding(.bottom, 60)
        }

    }


struct PageIndicator_Previews: PreviewProvider {
    static var previews: some View {
        PageIndicator(pageNumber: .constant(1))
    }
}
