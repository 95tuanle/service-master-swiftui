//
//  BookingStep2Page.swift
//  Final Project
//
//  Created by Mudit Dahiya on 2023-03-26.
//

import SwiftUI

struct BookingStep2View: View {
    enum urgencyChoice {
        case ASAP
        case Week
        case Anytime
    }
    
    @State var urgencyChoice: urgencyChoice = .ASAP
    @State var description: String = ""
    
    var body: some View {
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
                    self.urgencyChoice = .ASAP
                }) {
                    UrgencyButtonTextView(text: "ASAP",
                                          bgColor: self.urgencyChoice == .ASAP ? "black": "appOrange",
                                          fgColor: self.urgencyChoice == .ASAP ? "white": "black")
                }
                
                Button(action: {
                    self.urgencyChoice = .Week
                }) {
                    UrgencyButtonTextView(text: "1 Week",
                                          bgColor: self.urgencyChoice == .Week ? "black": "appOrange",
                                          fgColor: self.urgencyChoice == .Week ? "white": "black")
                }
                
                Button(action: {
                    self.urgencyChoice = .Anytime
                }) {
                    UrgencyButtonTextView(text: "Anytime",
                                          bgColor: self.urgencyChoice == .Anytime ? "black": "appOrange",
                                          fgColor: self.urgencyChoice == .Anytime ? "white": "black")
                }
            }

            HStack {
                Text("Description").fontWeight(.bold)
                    .padding([.top, .leading])
                Spacer()
            }
            
            TextField("Lorem ipsum dolor sit amet consectetur. Felis lacus faucibus sed mattis euismod fermentum est. Quis magna diam at accumsan proin velit ut pretium non. Diam auctor id augue venenatis eros massa. Diam vulputate lectus ac metus id tempor eu tempor. Porta convallis et et tortor nunc. Elit adipiscing duis velit lacus.", text: $description, axis: .vertical)
                .lineLimit(9...10)
                .frame(minHeight: 200, idealHeight: 200)
                .padding([.top, .bottom, .trailing, .leading])
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black)
                )
                .padding([.trailing, .leading])
            
            NavigationLink(destination: BookingStep1View()) {
                NavButtonTextView(text: "Previous step")
            }.padding([.top])
            
            NavigationLink(destination: BookingStep3View()) {
                NavButtonTextView(text: "Next Step")
            }.padding([.bottom])
            
            
            Spacer()
        }.navigationBarHidden(true)
    }
}

struct BookingStep2Page_Previews: PreviewProvider {
    static var previews: some View {
        BookingStep2View()
    }
}
