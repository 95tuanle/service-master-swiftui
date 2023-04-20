//
//  LandingView.swift
//  Service Master
//
//  Created by Tuan Le on 2023-03-23.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        NavigationStack {
            GeometryReader {geometryReader in ZStack {
                VStack {
                    VStack {
                        Image("Logo").resizable().aspectRatio(contentMode: .fit).frame(width: geometryReader.size.width*0.8)
                        Spacer()
                        Image("LandingImg").resizable().aspectRatio(contentMode: .fit)
                    }.frame(height: geometryReader.size.height*0.5)
                    Spacer()
                }
                VStack {
                    Spacer()
                    RoundedRectangle(cornerRadius: 33).fill(.white).frame(height: geometryReader.size.height*0.6)
                }.ignoresSafeArea()
                VStack {
                    Spacer()
                    VStack (spacing: geometryReader.size.height*0.01) {
                        Text("We’ve got everything for your home").fontWeight(.semibold)
                        Text("Service Master is a user-friendly application that allows homeowners to easily book house renovating services. Whether you're looking to update your kitchen, bathroom, or any other part of your home, Service Master has got you covered. With a wide range of services to choose from, including painting, flooring, plumbing, electrical work, and more, you can trust that your renovation needs will be met with expertise and professionalism.").multilineTextAlignment(.center)
                        Spacer()
                        NavigationLink(destination: IntroductionView()) {
                            Text("Let’s get started").fontWeight(.semibold).foregroundColor(.black)
                        }.frame(width: geometryReader.size.width*0.9, height: geometryReader.size.height*0.05).background(
                            RoundedRectangle(cornerRadius: 33).fill(Color("ButtonColor"))
                        )
                        Spacer()
                    }.frame(width: geometryReader.size.width*0.9, height: geometryReader.size.height*0.5)
                }
            }}.background(Color("BackgroundColor"))
        }.navigationBarHidden(true)
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
