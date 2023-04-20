//
//  DashboardView.swift
//  Service Master
//
//  Created by Tuan Le on 2023-03-26.
//

import SwiftUI
import FirebaseDatabase

struct ServicesView: View {
    @State var services: [Service] = []
    let ref = Database.database().reference()

    var body: some View {
        NavigationStack {
            GeometryReader {geometryReader in VStack {
                VStack() {
                    Image("Logo").resizable().aspectRatio(contentMode: .fit).frame(width: geometryReader.size.width*0.6)
                    Text("With Service Master, you can rest assured that your home renovation project is in good hands. Our team of skilled professionals is dedicated to providing high-quality, efficient, and reliable services to meet all of your renovation needs. Try Service Master today and see the difference for yourself.").multilineTextAlignment(.center)
                }.frame(width: geometryReader.size.width*0.9)
                NavigationLink(destination: BookingsView()) {
                    Text("View Bookings").fontWeight(.semibold).foregroundColor(.black)
                }.frame(width: geometryReader.size.width*0.5, height: geometryReader.size.height*0.05).background(
                    RoundedRectangle(cornerRadius: 33).fill(Color("ButtonColor"))
                )
                List(services, id: \.self) { service in
                    Section {
                        NavigationLink(destination: ServiceView(service)) {
                            Text(service.mainServices)
                        }
                    }
                }.scrollContentBackground(.hidden)
            }}.background(Color("BackgroundColor"))
        }.navigationBarHidden(true).onAppear(perform: {
            ref.getData(completion:  { error, snapshot in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return;
                }
                let data = snapshot?.value as? [NSDictionary] ?? []
                services = data.map({(service) -> Service in
                    return Service(service)
                })
            })
        })
    }
}

struct ServicesView_Previews: PreviewProvider {
    static var previews: some View {
        ServicesView()
    }
}
