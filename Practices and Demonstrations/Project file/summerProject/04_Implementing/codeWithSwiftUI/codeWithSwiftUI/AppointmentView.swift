//
//  AppointmentView.swift
//  codeWithSwiftUI
//

//

import SwiftUI

struct AppointmentView: View {
    let appointments: [Appointment]
    var body: some View {
        List {
            ForEach( appointments ) { appointment in
                NavigationLink(destination:
                    AppointmentDetailView(appoitment: appointment)
                ) {
                    SingleAppointmentView(appointment: appointment)
                }
                .listRowBackground(appointment.color)
            }
        }
        .navigationTitle("Appointments")
        .navigationBarItems(trailing: Button(action: {}) {
                    Image(systemName: "plus")
                })
    }
}

struct AppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AppointmentView(appointments: Appointment.data)
        }
    }
}
