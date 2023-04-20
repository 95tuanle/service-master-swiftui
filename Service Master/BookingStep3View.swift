//
//  BookingStep3Page.swift
//  Final Project
//
//  Created by Mudit Dahiya on 2023-03-26.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct BookingStep3View: View {
    @EnvironmentObject var service: Service
    @EnvironmentObject var booking: Booking
    @State private var invalidForm: Bool = false
    @State private var isReadyToNavigate: Bool = false
    @State private var isError = false
    @State private var errorMessage = ""
    let uid = Auth.auth().currentUser?.uid
    let db = Firestore.firestore()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image("Service-master-logo")
                
                NavBarView(one: "orange1", two: "orange2", three: "black3", four: "orange4")
                
                Group {
                    TextFieldView(stateVar: $booking.fullName, placeholder: "Full Name")
                    TextFieldView(stateVar: $booking.address, placeholder: "Address")
                    TextFieldView(stateVar: $booking.city, placeholder: "City")
                    TextFieldView(stateVar: $booking.province, placeholder: "Province")
                    TextFieldView(stateVar: $booking.contactNumber, placeholder: "Contact Number")
                    TextFieldView(stateVar: $booking.email, placeholder: "Email")
                }
                HStack {
                    Text("How would you like us to contact?").fontWeight(.bold)
                        .padding([.trailing, .leading])
                    Spacer()
                }
                
                HStack {
                    Button(action: {
                        booking.method = "Email"
                    }) {
                        UrgencyButtonTextView(text: "Email",
                                              bgColor: booking.method == "Email" ? "black": "appOrange",
                                              fgColor: booking.method == "Email" ? "white": "black")
                    }
                    
                    Button(action: {
                        booking.method = "Phone"
                    }) {
                        UrgencyButtonTextView(text: "Phone",
                                              bgColor: booking.method == "Phone" ? "black": "appOrange",
                                              fgColor: booking.method == "Phone" ? "white": "black")
                    }
                    
                    Button(action: {
                        booking.method = "Text"
                    }) {
                        UrgencyButtonTextView(text: "Text",
                                              bgColor: booking.method == "Text" ? "black": "appOrange",
                                              fgColor: booking.method == "Text" ? "white": "black")
                    }
                }
                
                NavigationLink(destination: BookingStep2View().environmentObject(service).environmentObject(booking)) {
                    NavButtonTextView(text: "Previous step")
                }.padding([.top])
                
                Button(action: {
                    if booking.fullName.isEmpty || booking.address.isEmpty || booking.city.isEmpty || booking.province.isEmpty || booking.contactNumber.isEmpty || booking.email.isEmpty || booking.method.isEmpty  {
                        invalidForm = true
                        isReadyToNavigate = false
                    } else {
                        
                        invalidForm = false
                        db.collection("bookings").addDocument(data: [
                            "service": [
                                "mainServices": service.mainServices,
                                "description": service.description
                            ],
                            "urgency": booking.urgency,
                            "fullName": booking.fullName,
                            "address": booking.address,
                            "city": booking.city,
                            "province": booking.province,
                            "contactNumber": booking.contactNumber,
                            "email": booking.email,
                            "method": booking.method,
                            "postalCode": booking.postalCode,
                            "description": booking.description,
                            "uid": uid!
                        ]) { err in
                            if let err = err {
                                isError = true
                                isReadyToNavigate = false
                                errorMessage = err.localizedDescription
                            } else {
                                isError = false
                                isReadyToNavigate = true
                            }
                        }
                    }
                }, label: {
                    NavButtonTextView(text: "Book now")
                }).alert("Invalid form", isPresented: $invalidForm) {
                    Button("OK", role: .cancel) { }
                }.alert(errorMessage, isPresented: $isError) {
                    Button("OK", role: .cancel) { }
                }.padding([.bottom])
            }.background(Color("BackgroundColor")).navigationDestination(isPresented: $isReadyToNavigate, destination: {BookingStep4View()})
        }.navigationBarHidden(true)
    }
}

struct BookingStep3Page_Previews: PreviewProvider {
    static var previews: some View {
        BookingStep3View().environmentObject(Service([
            "mainServices": "Bathroom Maintenance & Upgrade",
            "description": "Need a contractor to repair and upgrade your Bathroom but aren't sure where to find one? Get Connected to a Pro Service Provider through Service Master App!"
        ])).environmentObject(Booking())
    }
}
