//
//  FavoriteView.swift
//  codeWithSwiftUI
//

//

import SwiftUI

struct FavoriteView: View {
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

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FavoriteView(favoriteBarbers: Barber.data)
        }
    }
}
