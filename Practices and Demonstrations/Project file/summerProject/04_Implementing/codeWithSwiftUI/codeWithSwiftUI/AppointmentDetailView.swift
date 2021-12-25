//
//  AppointmentDetailView.swift
//  codeWithSwiftUI
//

//

import SwiftUI

struct AppointmentDetailView: View {
    let appoitment: Appointment
    var body: some View {
        List {
            Section(header: Text("Personal Info")) {
                HStack {
                    Label("Custumer: ", systemImage: "person")
                    Spacer()
                    Text(appoitment.custumerName)
                }
                
                HStack {
                    Label("Address: ", systemImage: "house")
                    Spacer()
                    Text(appoitment.address)
                }
                
                HStack {
                    Label("Phone Number: ", systemImage: "phone")
                    Spacer()
                    Text(appoitment.phoneNumber)
                }
            }
            
            Section(header: Text("Order Info")) {
                HStack {
                    Label("Barber: ", systemImage: "cart")
                    Spacer()
                    Text(appoitment.barberName)
                }
                
                HStack {
                    Label("Service Type: ", systemImage: "scissors")
                    Spacer()
                    Text(appoitment.serviceType)
                }
                
                HStack {
                    Label("Time: ", systemImage: "clock")
                    Spacer()
                    Text(appoitment.appointmentDate.description)
                }
                
                HStack {
                    Label("Cost: ", systemImage: "dollarsign.circle")
                    Spacer()
                    Text(String(appoitment.serviceCost))
                }
            }
            
            Section(header: Text("")){
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Finished")
                    })
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Cancel")
                    })
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct AppointmentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AppointmentDetailView(appoitment: Appointment.data[0])
        }
    }
}
