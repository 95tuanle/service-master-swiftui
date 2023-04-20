//
//  DashboardView.swift
//  Service Master
//
//  Created by Tuan Le on 2023-03-26.
//

import SwiftUI

struct Dashboard1View: View {
    private var services = ["Bathroom Maintenance & Upgrade", "Kitchen", "Cleaning Services", "Painting and Decoration", "Foundations", "Landscaping", "Pest Control", "Flooring"]
    var body: some View {
        NavigationStack {
            GeometryReader {geometryReader in VStack {
                VStack() {
                    Image("Logo").resizable().aspectRatio(contentMode: .fit).frame(width: geometryReader.size.width*0.6)
                    Text("With Service Master, you can rest assured that your home renovation project is in good hands. Our team of skilled professionals is dedicated to providing high-quality, efficient, and reliable services to meet all of your renovation needs. Try Service Master today and see the difference for yourself.").multilineTextAlignment(.center)
                }.frame(width: geometryReader.size.width*0.9)
                List(services, id: \.self) { service in
                    Section {
                        NavigationLink(destination: ServiceView()) {
                            Text(service)
                        }
                    }
                }.scrollContentBackground(.hidden)
            }}.background(Color("BackgroundColor"))
        }.navigationBarHidden(true)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard1View()
    }
}
