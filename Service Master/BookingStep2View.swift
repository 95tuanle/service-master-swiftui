//
//  BookingStep2Page.swift
//  Final Project
//
//  Created by Mudit Dahiya on 2023-03-26.
//

import SwiftUI

struct BookingStep2View: View {
    @EnvironmentObject var service: Service
    @EnvironmentObject var booking: Booking
    @State private var invalidForm: Bool = false
    @State private var isReadyToNavigate: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image("Service-master-logo")
                
                NavBarView(one: "orange1", two: "black2", three: "orange3", four: "orange4")
                
                HStack {
                    Text("Is it urgent?").fontWeight(.bold)
                        .padding([.top, .leading])
                    Spacer()
                }
                
                HStack {
                    Button(action: {
                        booking.urgency = "ASAP"
                    }) {
                        UrgencyButtonTextView(text: "ASAP",
                                              bgColor: booking.urgency == "ASAP" ? "black": "appOrange",
                                              fgColor: booking.urgency == "ASAP" ? "white": "black")
                    }
                    
                    Button(action: {
                        booking.urgency = "1 Week"
                    }) {
                        UrgencyButtonTextView(text: "1 Week",
                                              bgColor: booking.urgency == "1 Week" ? "black": "appOrange",
                                              fgColor: booking.urgency == "1 Week" ? "white": "black")
                    }
                    
                    Button(action: {
                        booking.urgency = "Anytime"
                    }) {
                        UrgencyButtonTextView(text: "Anytime",
                                              bgColor: booking.urgency == "Anytime" ? "black": "appOrange",
                                              fgColor: booking.urgency == "Anytime" ? "white": "black")
                    }
                }
                
                HStack {
                    Text("Description").fontWeight(.bold)
                        .padding([.top, .leading])
                    Spacer()
                }
                
                TextField("Lorem ipsum dolor sit amet consectetur. Felis lacus faucibus sed mattis euismod fermentum est. Quis magna diam at accumsan proin velit ut pretium non. Diam auctor id augue venenatis eros massa. Diam vulputate lectus ac metus id tempor eu tempor. Porta convallis et et tortor nunc. Elit adipiscing duis velit lacus.", text: $booking.description, axis: .vertical)
                    .lineLimit(9...10)
                    .frame(minHeight: 200, idealHeight: 200)
                    .padding([.top, .bottom, .trailing, .leading])
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black)
                    )
                    .padding([.trailing, .leading])
                
                NavigationLink(destination: BookingStep1View().environmentObject(service).environmentObject(booking)) {
                    NavButtonTextView(text: "Previous step")
                }.padding([.top])
                
                Button(action: {
                    if booking.description.isEmpty || booking.urgency.isEmpty {
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
                Spacer()
            }.background(Color("BackgroundColor")).navigationDestination(isPresented: $isReadyToNavigate, destination: {BookingStep3View().environmentObject(service).environmentObject(booking)})
        }.navigationBarHidden(true)
    }
}

struct BookingStep2Page_Previews: PreviewProvider {
    static var previews: some View {
        BookingStep2View().environmentObject(Service([
            "mainServices": "Bathroom Maintenance & Upgrade",
            "description": "Need a contractor to repair and upgrade your Bathroom but aren't sure where to find one? Get Connected to a Pro Service Provider through Service Master App!"
        ])).environmentObject(Booking())
    }
}
