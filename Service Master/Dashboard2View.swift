//
//  ContentView.swift
//  ServiceMasterDashboardETC
//
//  Created by Yigit Kilic on 2023-03-23.
//

import SwiftUI


struct OrangeButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.all, 5).frame(width: 377, height: 39, alignment: .center)
            .background(Color(red: 231/255, green: 168/255, blue: 17/255))
            .foregroundColor(.black)
            .clipShape(Capsule())
            .padding(.all,8)

    }
}

    

struct Dashboard2View: View {
    
    
    @State private var textField1 : String = ""

    var body: some View {
        Group{
            VStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 264, height: 102, alignment: .topLeading)
                //                .imageScale(.large)
                    .padding(.vertical, 20)
                Text("Hi $user how can we help you today?") .bold()
                    .frame(width: 303, height: 22, alignment: .leading)
                    .padding(.bottom, 20)
                
                TextField ("I am looking for a master about..", text: $textField1)
              
                
                    .padding(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 0.2)
                    )
                    .frame(width: 377, height: 39, alignment: .center)
                    .padding(.bottom, 20)

                
                Text("Meet with new masters in your area!") .bold()
                    .frame(width: 303, height: 22, alignment: .leading)
                
                HStack{
                    VStack{
                        Image("providers")
                            .resizable()
                            .frame(width: 74, height: 81, alignment: .center)
                        Text("ABC Plumbers") .bold()
                            .frame(width: 93, height: 22, alignment: .center)
                            .font(.system(size:13))
                        
                    }.padding(.all, 15)
                    VStack{
                        Image("providers")
                            .resizable()
                            .frame(width: 74, height: 81, alignment: .center)
                        Text("DEF Plumbers") .bold()
                            .frame(width: 93, height: 22, alignment: .center)
                            .font(.system(size:13))
                    }.padding(.all, 15)
                    VStack{
                        Image("providers")
                            .resizable()
                            .frame(width: 74, height: 81, alignment: .topLeading)
                        Text("XYZ Plumbers") .bold()
                            .frame(width: 93, height: 22, alignment: .center)
                            .font(.system(size:13))
                    }.padding(.all, 15)
                }
                Text("Review us on AppStore") .bold()
                    .frame(width: 303, height: 22, alignment: .leading)
                Group{
                    HStack{
                            ZStack{
                                Image("reviewCircle")
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .topLeading)
                                //                .imageScale(.large)
                                    .padding(.all, 4)
                                Image("Star")
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .topLeading)
                                //                .imageScale(.large)
                                    .padding(.all, 4)
                            }
                        ZStack{
                            Image("reviewCircle")
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .topLeading)
                            //                .imageScale(.large)
                                .padding(.all, 4)
                            Image("Star")
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .topLeading)
                            //                .imageScale(.large)
                                .padding(.all, 4)
                        }
                        ZStack{
                            Image("reviewCircle")
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .topLeading)
                            //                .imageScale(.large)
                                .padding(.all, 4)
                            Image("Star")
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .topLeading)
                            //                .imageScale(.large)
                                .padding(.all, 4)
                        }
                        ZStack{
                            Image("reviewCircle")
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .topLeading)
                            //                .imageScale(.large)
                                .padding(.all, 4)
                            Image("Star")
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .topLeading)
                            //                .imageScale(.large)
                                .padding(.all, 4)
                        }
                        ZStack{
                            Image("reviewCircle")
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .topLeading)
                            //                .imageScale(.large)
                                .padding(.all, 4)
                            Image("Star")
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .topLeading)
                            //                .imageScale(.large)
                                .padding(.all, 4)
                        }
                            
                        
                    }
                    
                    VStack{
                        
                        
                        Text("Schedule a service master right now") .bold()
                            .frame(width: 303, height: 22, alignment: .leading)
                        
                       
                        NavigationLink(destination: FavoriteMastersView()) {
                            Text("My favorite Masters")
                        }.buttonStyle(OrangeButtonStyle())
                        
                        NavigationLink(destination: ReferFriendView()) {
                            Text("Refer a friend and earn $25")
                        }.buttonStyle(OrangeButtonStyle())
                        
                        NavigationLink(destination: FaqView()) {
                            Text("Help")
                        }.buttonStyle(OrangeButtonStyle())
                        
                        NavigationLink(destination: LandingView()) {
                            Text("Sign out")
                        }.buttonStyle(OrangeButtonStyle())
                        
                    }
                    
                }
                
            }
        
        }.navigationBarHidden(true)
        .background(Color(red: 0.929, green: 0.929, blue: 0.929))

    }
        

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard2View()
    }
}
