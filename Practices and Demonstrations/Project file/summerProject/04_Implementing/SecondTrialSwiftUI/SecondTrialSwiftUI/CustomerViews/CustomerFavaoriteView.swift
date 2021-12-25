//
//  CustomerFavaoriteView.swift
//  SecondTrialSwiftUI
//
//  Created by Wayne on 2021/7/21.
//

import SwiftUI

struct CustomerFavaoriteView: View {
    var favoriteBarbers: [Barber]
    var body: some View {
        List{
            
            ForEach(favoriteBarbers){
                favoriteBarber in
                NavigationLink(destination:
                    BarberDetailView(barberDetail: favoriteBarber)
                ) {
                    Text(favoriteBarber.barberName)
                }
            }
            .navigationTitle("Favorite Barbers")
        }
    }
}

struct CustomerFavaoriteView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomerFavaoriteView(favoriteBarbers: Barber.data)
        }
    }
}
