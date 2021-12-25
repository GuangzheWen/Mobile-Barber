//
//  SingleAppointmentView.swift
//  codeWithSwiftUI
//

//

import SwiftUI

struct SingleAppointmentView: View {
    let appointment: Appointment
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(appointment.barberName) service")
                .font(.headline)
            
            Spacer()
            HStack {
                Label("Custumer: ", systemImage: "person")
                Spacer()
                Text(appointment.custumerName)
            }
            Spacer()
            HStack {
                Label("Time: ", systemImage: "clock")
                Spacer()
                Text("//date to be fixed")
            }
            Spacer()
            HStack {
                Label("Service type: ", systemImage: "scissors")
                Spacer()
                Text(appointment.serviceType)
            }
            Spacer()
            HStack {
                Label("Cost: ", systemImage: "dollarsign.circle")
                Spacer()
                Text(String(appointment.serviceCost))
            }
            
            
        }
        // .cornerRadius(5.0)
        .padding()
        
        .foregroundColor(.white)
        
    }
}

struct SingleAppointmentView_Previews: PreviewProvider {
    static var appointment: Appointment = Appointment.data[0]
    static var previews: some View {
        SingleAppointmentView(appointment: appointment)
            .background(appointment.color)
            .previewLayout(.fixed(width: 300, height: 200))
            
    }
}
