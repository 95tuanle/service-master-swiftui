//
//  BookingStep4Page.swift
//  Final Project
//
//  Created by Mudit Dahiya on 2023-03-26.
//

import SwiftUI

struct BookingStep4View: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image("Service-master-logo")
                
                NavBarView(one: "orange1", two: "orange2", three: "orange3", four: "black4")
                
                
                HStack {
                    Text("Thanks for choosing Service Master").fontWeight(.bold)
                        .padding([.top, .trailing, .leading])
                    Spacer()
                }
                
                HStack {
                    Text("Here are the local service providers who will contact you shortly.")
                        .padding([.bottom, .trailing, .leading])
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    ProfileImageView(name: "ABC Plumbers")
                    Spacer()
                    ProfileImageView(name: "XYZ Plumbers")
                    Spacer()
                    ProfileImageView(name: "B2B Plumbers")
                    Spacer()

                }
                .padding()
                
                Divider()
                    .padding([.trailing, .leading], 70)
                
                HStack {
                    Text("What happens next?").fontWeight(.bold)
                        .padding([.trailing, .leading])
                    Spacer()
                }
                
                Text("Lorem ipsum dolor sit amet consectetur. Feugiat morbi enim etiam gravida non vitae. Est amet risus sagittis nisi nunc facilisi dapibus placerat sed. Vel eget bibendum nisl etiam. Suspendisse magna natoque adipiscing a fermentum amet vulputate elementum mi. Netus mi eget tortor amet vitae egestas. Dolor amet libero a sit vestibulum eget non duis nec.")
                    .padding([.leading, .trailing])
               

                NavigationLink(destination: DashboardView()) {
                    NavButtonTextView(text: "Go to dashboard")
                }.padding([.bottom])
                Spacer()
            }.background(Color("BackgroundColor"))
        }.navigationBarHidden(true)
    }
}

struct BookingStep4Page_Previews: PreviewProvider {
    static var previews: some View {
        BookingStep4View()
    }
}
