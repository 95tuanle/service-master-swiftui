//
//  BookingStep1Page.swift
//  Final Project
//
//  Created by Mudit Dahiya on 2023-03-26.
//

import SwiftUI

struct BookingStep1View: View {
    @State var postal: String = ""
    var service: Service
    init(_ service: Service) {
        self.service = service
    }
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image("Service-master-logo")
                
                NavBarView(one: "black1", two: "orange2", three: "orange3", four: "orange4")
                
                HStack {
                    Text("Enter your postal code").fontWeight(.bold).padding()
                    Spacer()
                }
                
                TextFieldView(stateVar: $postal, placeholder: "L6Y 5N4")
                
                NavigationLink(destination: BookingStep2View(service)) {
                    NavButtonTextView(text: "Next Step")
                }.padding([.top, .bottom])
                
                
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
            }.background(Color("BackgroundColor"))
        }.navigationBarHidden(true)
    }
}

struct BookingStep1Page_Previews: PreviewProvider {
    static var previews: some View {
        let dictionary: NSDictionary = [
            "mainServices": "Bathroom Maintenance & Upgrade",
            "description": "Need a contractor to repair and upgrade your Bathroom but aren't sure where to find one? Get Connected to a Pro Service Provider through Service Master App!"
        ]
        BookingStep1View(Service(dictionary))
    }
}
