//
//  BookingStep3Page.swift
//  Final Project
//
//  Created by Mudit Dahiya on 2023-03-26.
//

import SwiftUI

struct BookingStep3View: View {
    enum contactChoice {
        case email
        case phone
        case text
    }
    
    @State var contactChoice: contactChoice = .phone
    @State var fullName: String = ""
    @State var address: String = ""
    @State var city: String = ""
    @State var province: String = ""
    @State var contactNumber: String = ""
    @State var email: String = ""
    
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image("Service-master-logo")
                
                NavBarView(one: "orange1", two: "orange2", three: "black3", four: "orange4")
                
                Group {
                    TextFieldView(stateVar: $fullName, placeholder: "Full Name")
                    TextFieldView(stateVar: $address, placeholder: "Address")
                    TextFieldView(stateVar: $city, placeholder: "City")
                    TextFieldView(stateVar: $province, placeholder: "Province")
                    TextFieldView(stateVar: $contactNumber, placeholder: "Contact Number")
                    TextFieldView(stateVar: $email, placeholder: "Email")
                }
                
                
                HStack {
                    Text("How would you like us to contact?").fontWeight(.bold)
                        .padding([.trailing, .leading])
                    Spacer()
                }
                
                HStack {
                    Button(action: {
                        self.contactChoice = .email
                    }) {
                        UrgencyButtonTextView(text: "Email",
                                              bgColor: self.contactChoice == .email ? "black": "appOrange",
                                              fgColor: self.contactChoice == .email ? "white": "black")
                    }
                    
                    Button(action: {
                        self.contactChoice = .phone
                    }) {
                        UrgencyButtonTextView(text: "Phone",
                                              bgColor: self.contactChoice == .phone ? "black": "appOrange",
                                              fgColor: self.contactChoice == .phone ? "white": "black")
                    }
                    
                    Button(action: {
                        self.contactChoice = .text
                    }) {
                        UrgencyButtonTextView(text: "Text",
                                              bgColor: self.contactChoice == .text ? "black": "appOrange",
                                              fgColor: self.contactChoice == .text ? "white": "black")
                    }
                }
                
                
                NavigationLink(destination: BookingStep2View()) {
                    NavButtonTextView(text: "Previous step")
                }.padding([.top])
                
                NavigationLink(destination: BookingStep4View()) {
                    NavButtonTextView(text: "Next Step")
                }.padding([.bottom])
                
            }.background(Color("BackgroundColor"))
        }.navigationBarHidden(true)
    }
}

struct BookingStep3Page_Previews: PreviewProvider {
    static var previews: some View {
        BookingStep3View()
    }
}
