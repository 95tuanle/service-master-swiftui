//
//  FavoriteView.swift
//  ServiceMasterDashboardETC
//
//  Created by Yigit Kilic on 2023-03-26.
//

import SwiftUI

struct FavoriteMastersView: View {
    var body: some View {
        Group{
            VStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 264, height: 102, alignment: .topLeading)
                //                .imageScale(.large)
                    .padding(.vertical, 20)
                Text("Your favorite masters") .font(.headline)
                    .frame(width: 303, height: 22, alignment: .leading)
                    .padding(.bottom, 20)
                Text("Lorem ipsum dolor sit amet consctetur. Turpis mauris tellus donec cursus erta arcu. Laculis pellentesque")
                    .frame(width: 303, height: 66, alignment: .center)
                    .lineLimit(4)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 20)
                
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
                HStack{
                    
                    Button (" Book\nAgain"){
                        
                    }.buttonStyle(OrangeSmallButtonStyle())
                    Button ("Share your\nComments"){
                        
                    }.buttonStyle(OrangeSmallButtonStyle())
                    Button (" Remove\nFrom List"){
                        
                    }.buttonStyle(OrangeSmallButtonStyle())
                    
                }
                VStack{
                    ZStack{
                    label: do {
                        Label(
                            "My last service", systemImage: "").padding(.all, 10).font(.headline)
                            .foregroundColor(.black)
                            .frame(width: 377, height: 150, alignment: .topLeading)
                            .background(Color(red: 255/255, green: 255/255, blue: 255/255))
                            .foregroundColor(.black)
                        //                            .clipShape(Capsule())
                            .padding(.all,8)
                        
                        Text("Lorem ipsum dolor sit amet consctetur. Turpis mauris tellus donec cursus erta arcu. Laculis pellentesque")
                            .frame(width: 303, height: 66, alignment: .center)
                            .lineLimit(4)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 20)
                        
                        
                        Button ("Add Favorites"){
                            
                        }.buttonStyle(OrangeButtonStyle())
                            .padding(.top,100)
                    }
                        
                    }
                    Spacer()
                    NavigationLink(destination: Dashboard2View()) {
                        Text("Go to dashboard")
                    }.buttonStyle(OrangeButtonStyle())
                    Spacer()

                }
                
            }
            
        }.navigationBarHidden(true).background(Color(red: 0.929, green: 0.929, blue: 0.929))
        
    }
    
}


struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteMastersView()
    }
}
