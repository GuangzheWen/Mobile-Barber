//
//  PageView.swift
//  featureTest716
//
//  Created by Wayne on 2021/7/16.
//

import SwiftUI

struct PageView: View {
    
    var imageName = "image"
    var title = "Exolore"
    var subTitle = "Variety xxxxxx xxxxxx xxxxxxx xxxxxx"
    var slogen = "1213 !"
    
    
    var body: some View {
        
        VStack {
        Spacer()
        Image(imageName)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 150, height: 150, alignment: .center)
        .clipShape(Circle())
        .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0.0, y: 10.0)

        Text(title)
    .font(.system(size: 36))
    .bold()
    .padding(.top, 70)



    Text(subTitle)
    .multilineTextAlignment(.center)
    .foregroundColor(.gray)
    .padding(.top, 20)
    .padding(.bottom, 20)



    Text(slogen)
    .font(.system(size: 22))
    .foregroundColor(.orange)


    Spacer()
    }
    .frame(width: UIScreen.main.bounds.width)
    }
    
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView()
    }
}
