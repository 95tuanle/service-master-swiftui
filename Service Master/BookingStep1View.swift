//
//  BookingStep1Page.swift
//  Final Project
//
//  Created by Mudit Dahiya on 2023-03-26.
//

import SwiftUI

struct BookingStep1View: View {
    @EnvironmentObject var service: Service
    @State private var invalidForm: Bool = false
    @State private var isReadyToNavigate: Bool = false
    @StateObject var booking = Booking()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image("Service-master-logo")
                NavBarView(one: "black1", two: "orange2", three: "orange3", four: "orange4")
                HStack {
                    Text("Enter your postal code").fontWeight(.bold).padding()
                    Spacer()
                }
                TextFieldView(stateVar: $booking.postalCode, placeholder: "L6Y 5N4")
                Button(action: {
                    if booking.postalCode.isEmpty {
                        invalidForm = true
                        isReadyToNavigate = false
                    } else {
                        invalidForm = false
                        isReadyToNavigate = true
                    }
                }, label: {
                    NavButtonTextView(text: "Next Step")
                }).alert("Invalid form", isPresented: $invalidForm) {
                    Button("OK", role: .cancel) { }
                }
                
                Divider()
                    .padding([.trailing, .leading], 70)
                
                HStack {
                    Text("How we work?").fontWeight(.bold)
                        .padding()
                    Spacer()
                }
                
                Text("The app offers a seamless booking process, allowing you to quickly and easily schedule a service appointment at a time that works best for you. Simply select the service you need, choose a date and time that works for you, and sit back and relax while Service Master takes care of the rest. You can also track the status of your service appointment and receive real-time updates on the progress of your renovation.")
                    .padding([.leading, .trailing])
                
                Spacer()
            }.background(Color("BackgroundColor")).navigationDestination(isPresented: $isReadyToNavigate, destination: {BookingStep2View().environmentObject(booking).environmentObject(service)})
        }.navigationBarHidden(true)
    }
}

struct BookingStep1Page_Previews: PreviewProvider {
    static var previews: some View {
        BookingStep1View().environmentObject(Service([
            "mainServices": "Bathroom Maintenance & Upgrade",
            "description": "Need a contractor to repair and upgrade your Bathroom but aren't sure where to find one? Get Connected to a Pro Service Provider through Service Master App!"
        ]))
    }
}
