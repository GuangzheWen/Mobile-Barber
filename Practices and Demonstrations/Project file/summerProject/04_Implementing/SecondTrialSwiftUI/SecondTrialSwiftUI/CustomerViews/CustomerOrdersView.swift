//
//  CustomerAppointmentView.swift
//  SecondTrialSwiftUI
//
//  Created by Wayne on 2021/7/21.
//

import SwiftUI

struct CustomerOrdersView: View {
    
    let appointments: [Appointment]
    @Binding var isCustomer: Bool
    
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

struct CustomerOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomerOrdersView(appointments: Appointment.data, isCustomer: .constant(false))
        }
    }
}
