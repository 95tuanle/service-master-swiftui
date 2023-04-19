//
//  IntroductionView.swift
//  Service Master
//
//  Created by Tuan Le on 2023-03-23.
//

import SwiftUI

struct IntroductionView: View {
    private var services = ["Bathroom Maintenance & Upgrade", "Kitchen", "Cleaning Services", "Painting and Decoration", "Foundations", "Landscaping", "Pest Control", "Flooring"]
    
    var body: some View {
        GeometryReader{geometryReader in VStack {
            VStack(spacing: geometryReader.size.height*0.02) {
                Image("Logo").resizable().aspectRatio(contentMode: .fit).frame(width: geometryReader.size.width*0.6)
                Text("Service Master also offers competitive pricing, with transparent and upfront quotes for all services. You can trust that you're getting the best value for your money, without any hidden fees or surprises.").multilineTextAlignment(.center)
                VStack {
                    Spacer()
                    Text("To enjoy our benefits").fontWeight(.semibold)
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: SignUpView()) {
                            Text("Sign up").fontWeight(.semibold).foregroundColor(.black)
                        }.frame(width: geometryReader.size.width*0.3, height: geometryReader.size.height*0.05).background(
                            RoundedRectangle(cornerRadius: 33).fill(Color("ButtonColor"))
                        )
                        Spacer()
                        NavigationLink(destination: SignInView()) {
                            Text("Sign in").fontWeight(.semibold).foregroundColor(.black)
                        }.frame(width: geometryReader.size.width*0.3, height: geometryReader.size.height*0.05).background(
                            RoundedRectangle(cornerRadius: 33).fill(Color("ButtonColor"))
                        )
                        Spacer()
                    }
                    Spacer()
                }.background(RoundedRectangle(cornerRadius: 33).fill(.white))
                Spacer()
            }.frame(width: geometryReader.size.width*0.9, height: geometryReader.size.height*0.5)
            Spacer()
            List(services, id: \.self) { service in
                Section {
                    Text(service)
                }
            }.scrollContentBackground(.hidden)
        }}.background(Color("BackgroundColor")).navigationBarHidden(true)
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView()
    }
}
