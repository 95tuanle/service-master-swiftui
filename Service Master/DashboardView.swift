//
//  ContentView.swift
//  ServiceMasterDashboardETC
//
//  Created by Yigit Kilic on 2023-03-23.
//

import SwiftUI
import FirebaseAuth

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

struct DashboardView: View {
    @State private var textField1 : String = ""
    
    @State private var isSignedOut: Bool = false
    @State private var invalidForm: Bool = false
    @State private var isError = false
    @State private var errorMessage = ""
    let email = Auth.auth().currentUser?.email
    var body: some View {
        NavigationStack {
            GeometryReader {geometryReader in Group {
                VStack {
                    Image("Logo").resizable().aspectRatio(contentMode: .fit).frame(width: geometryReader.size.width*0.6)
                    Text("Hi \(email ?? "user") how can we help you?").bold()
                    TextField ("I am looking for a master about..", text: $textField1).padding(3).overlay(RoundedRectangle(cornerRadius: 33).stroke(Color.gray, lineWidth: 0.2)).frame(width: geometryReader.size.width*0.9, alignment: .center)
                    Text("Meet with new masters in your area!").bold()
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
                    Text("Review us on AppStore").bold()
                    Group{
                        HStack{
                            ZStack{
                                Image("reviewCircle")
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .topLeading)
                                    .padding(.all, 4)
                                Image("Star")
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .topLeading)
                                    .padding(.all, 4)
                            }
                            ZStack{
                                Image("reviewCircle")
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .topLeading)
                                    .padding(.all, 4)
                                Image("Star")
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .topLeading)
                                    .padding(.all, 4)
                            }
                            ZStack{
                                Image("reviewCircle")
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .topLeading)
                                    .padding(.all, 4)
                                Image("Star")
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .topLeading)
                                    .padding(.all, 4)
                            }
                            ZStack{
                                Image("reviewCircle")
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .topLeading)
                                    .padding(.all, 4)
                                Image("Star")
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .topLeading)
                                    .padding(.all, 4)
                            }
                            ZStack{
                                Image("reviewCircle")
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .topLeading)
                                    .padding(.all, 4)
                                Image("Star")
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .topLeading)
                                    .padding(.all, 4)
                            }
                        }
                        VStack {
                            Text("Schedule a service master right now").bold()
                            NavigationLink(destination: BookingsView()) {
                                Text("Bookings").fontWeight(.semibold).foregroundColor(.black)
                            }.frame(width: geometryReader.size.width*0.9, height: geometryReader.size.height*0.05).background(
                                RoundedRectangle(cornerRadius: 33).fill(Color("ButtonColor"))
                            )
                            NavigationLink(destination: ServicesView()) {
                                Text("Services").fontWeight(.semibold).foregroundColor(.black)
                            }.frame(width: geometryReader.size.width*0.9, height: geometryReader.size.height*0.05).background(
                                RoundedRectangle(cornerRadius: 33).fill(Color("ButtonColor"))
                            )
                            NavigationLink(destination: FavoriteMastersView()) {
                                Text("Masters").fontWeight(.semibold).foregroundColor(.black)
                            }.frame(width: geometryReader.size.width*0.9, height: geometryReader.size.height*0.05).background(
                                RoundedRectangle(cornerRadius: 33).fill(Color("ButtonColor"))
                            )
                            NavigationLink(destination: ReferFriendView()) {
                                Text("Refer a friend and earn $25").fontWeight(.semibold).foregroundColor(.black)
                            }.frame(width: geometryReader.size.width*0.9, height: geometryReader.size.height*0.05).background(
                                RoundedRectangle(cornerRadius: 33).fill(Color("ButtonColor"))
                            )
                            NavigationLink(destination: FaqView()) {
                                Text("Help").fontWeight(.semibold).foregroundColor(.black)
                            }.frame(width: geometryReader.size.width*0.9, height: geometryReader.size.height*0.05).background(
                                RoundedRectangle(cornerRadius: 33).fill(Color("ButtonColor"))
                            )
                            Button(action: {
                                do {
                                    try Auth.auth().signOut()
                                    isSignedOut = true
                                } catch let signOutError as NSError {
                                    isSignedOut = false
                                    isError = true
                                    errorMessage = signOutError.localizedDescription
                                }
                            }, label: {
                                Text("Sign out").fontWeight(.semibold).foregroundColor(.black)
                            }).frame(width: geometryReader.size.width*0.9, height: geometryReader.size.height*0.05).background(
                                RoundedRectangle(cornerRadius: 33).fill(Color("ButtonColor"))
                            ).alert(errorMessage, isPresented: $isError) {
                                Button("OK", role: .cancel) { }
                            }
                        }
                    }
                }
            }}.background(Color("BackgroundColor")).navigationDestination(isPresented: $isSignedOut, destination: {LandingView()})
        }.navigationBarHidden(true)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
