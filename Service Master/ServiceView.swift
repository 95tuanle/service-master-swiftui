//
//  ServiceView.swift
//  Service Master
//
//  Created by Tuan Le on 2023-03-26.
//

import SwiftUI

struct ServiceView: View {
    private var services = ["Bathroom Maintenance & Upgrade", "Kitchen", "Cleaning Services", "Painting and Decoration", "Foundations", "Landscaping", "Pest Control", "Flooring"]
    var body: some View {
        NavigationStack {
            GeometryReader{geometryReader in LazyVStack(spacing: geometryReader.size.height*0.1) {
                Image("Logo").resizable().aspectRatio(contentMode: .fit).frame(width: geometryReader.size.width*0.6)
                VStack(spacing: geometryReader.size.height*0.05) {
                    Text("Bathroom Maintenance & Upgrade").fontWeight(.semibold)
                    Text("Need a contractor to repair and upgrade your Bathroom but aren't sure where to find one? Get Connected to a Pro Service Provider through Service Master App!").multilineTextAlignment(.center)
                    NavigationLink(destination: BookingStep1View()) {
                        Text("Book now").fontWeight(.semibold).foregroundColor(.black)
                    }.frame(width: geometryReader.size.width*0.7, height: geometryReader.size.height*0.05).background(
                        RoundedRectangle(cornerRadius: 33).fill(Color("ButtonColor"))
                    )
                }.frame(width: geometryReader.size.width*0.7).padding(geometryReader.size.width*0.1).background(RoundedRectangle(cornerRadius: 33).fill(.white))
            
            }}.background(Color("BackgroundColor"))
        }.navigationBarHidden(true)
    }
}

struct ServiceView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceView()
    }
}
