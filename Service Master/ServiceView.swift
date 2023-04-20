//
//  ServiceView.swift
//  Service Master
//
//  Created by Tuan Le on 2023-03-26.
//

import SwiftUI

struct ServiceView: View {
    @EnvironmentObject var service: Service
    
    var body: some View {
        NavigationStack {
            GeometryReader{geometryReader in LazyVStack(spacing: geometryReader.size.height*0.03) {
                Image("Logo").resizable().aspectRatio(contentMode: .fit).frame(width: geometryReader.size.width*0.6)
                VStack(spacing: geometryReader.size.height*0.05) {
                    Text(service.mainServices).fontWeight(.semibold)
                    Text(service.description).multilineTextAlignment(.center)
                    NavigationLink(destination: BookingStep1View().environmentObject(service)) {
                        Text("Book now").fontWeight(.semibold).foregroundColor(.black)
                    }.frame(width: geometryReader.size.width*0.7, height: geometryReader.size.height*0.05).background(
                        RoundedRectangle(cornerRadius: 33).fill(Color("ButtonColor"))
                    )
                    NavigationLink(destination: ServicesView()) {
                        Text("View Services")
                    }
                }.frame(width: geometryReader.size.width*0.7).padding(geometryReader.size.width*0.1).background(RoundedRectangle(cornerRadius: 33).fill(.white))
            }}.background(Color("BackgroundColor"))
        }.navigationBarHidden(true)
    }
}

struct ServiceView_Previews: PreviewProvider {
    static var previews: some View {
        let dictionary: NSDictionary = [
            "mainServices": "Bathroom Maintenance & Upgrade",
            "description": "Need a contractor to repair and upgrade your Bathroom but aren't sure where to find one? Get Connected to a Pro Service Provider through Service Master App!"
        ]
        
        ServiceView().environmentObject(Service(dictionary))
    }
}
