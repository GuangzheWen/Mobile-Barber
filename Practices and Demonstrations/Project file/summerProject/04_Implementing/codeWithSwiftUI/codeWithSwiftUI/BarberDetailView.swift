//
//  BarberDetailView.swift
//  codeWithSwiftUI
//
//  Created by Wayne on 2021/7/2.
//

import SwiftUI
import UIKit

struct BarberDetailView: View {
    let barberDetail: Barber
    var body: some View {
        VStack(alignment: .leading) {
            Image("Unknown")
                .resizable()
                
                
            List {
                Section(header: Text("Barber Info")){
                    
                    
                    HStack {
                        Text("Barber Name:")
                        Spacer()
                        Text(barberDetail.barberName)
                    }
                    
                    VStack {
                        HStack {
                            Text("Barber position:")
                            Spacer()
                            Text(barberDetail.position)
                            
                        }
                        ContainerRelativeShape()
                            .frame(width: 300.0, height: 200.0)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.gray/*@END_MENU_TOKEN@*/)
                        
                    }
                    
                }
                
                Section(header: Text("Service Info")){
                    ForEach(barberDetail.serviceTypes, id: \.self){
                        service in
                        Text(service)
                    }
                }
            }
            
        }
        .navigationTitle(barberDetail.barberName)
        
    }
}

struct BarberDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BarberDetailView(barberDetail: Barber.data[0])
        }
    }
}
