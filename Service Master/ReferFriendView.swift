//
//  ReferFriendView.swift
//  ServiceMasterDashboardETC
//
//  Created by Yigit Kilic on 2023-03-23.
//

import SwiftUI


struct OrangeSmallButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.all, 5).frame(width: 111, height: 66, alignment: .center)
            .background(Color(red: 231/255, green: 168/255, blue: 17/255))
            .foregroundColor(.white).bold()
//            .clipShape(Capsule())
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.all,8)

    }
}

struct BlackSmallButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.all, 5).frame(width: 111, height: 45, alignment: .center)
            .background(Color.black)
            .foregroundColor(.white).bold()
//            .clipShape(Capsule())
            .clipShape(RoundedRectangle(cornerRadius: 20))
//            .padding(.all,8)

    }
}


struct ReferFriendView: View {
    
    @State private var textField2 : String = ""

    
    var body: some View {
        NavigationStack {
            VStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 264, height: 102, alignment: .topLeading)
                //                .imageScale(.large)
                    .padding(.vertical, 20)
                Text("Refer a friend get a discount") .bold()
                    .frame(width: 303, height: 22, alignment: .center)
                    .padding(.bottom, 20)
                
                ZStack{
                    
                
                TextField ("https://link25dollars,..", text: $textField2)
                    .padding(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 0.2)
                    )
                    .frame(width: 377, height: 39, alignment: .center)
                Button ("Copylink"){}.buttonStyle(BlackSmallButtonStyle())
                        .padding(.leading, 257)
                
                    
                }
                .padding(.bottom, 20)
                
                Text("Choose a way to share!") .bold()
                    .frame(width: 303, height: 22, alignment: .center)
                
                HStack{
                    
                    Button ("Twitter"){
                        
                    }.buttonStyle(OrangeSmallButtonStyle())
                    Button ("FB"){
                        
                    }.buttonStyle(OrangeSmallButtonStyle())
                    Button ("WhatsApp"){
                        
                    }.buttonStyle(OrangeSmallButtonStyle())
                    
                }
                
               
                Image("LandingImg")
                    .resizable()
                    .frame(width: 393, height: 221, alignment: .topLeading)

                    .padding(.vertical, 20)
                
                Spacer()
                
                
                NavigationLink(destination: DashboardView()) {
                    Text("Go to dashboard")
                }.buttonStyle(OrangeButtonStyle())
                Spacer()

            }.background(Color("BackgroundColor"))
        }.navigationBarHidden(true)
    }
}

struct ReferFriendView_Previews: PreviewProvider {
    static var previews: some View {
        ReferFriendView()
    }
}
