//
//  FaqView.swift
//  ServiceMasterDashboardETC
//
//  Created by Yigit Kilic on 2023-03-26.
//

import SwiftUI

struct QuestionAccordionButtonStyle: ButtonStyle {
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
struct AnswerAccordionButtonStyle: ButtonStyle {
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


//We can use this part when creat the logic so please dont delete it
//struct AccordionView: View {
//    var body: some View {
//        VStack{
//            DisclosureGroup(
//                content: { AnswerView()
//
//                },
//                label: {
//                    Label(
//                        "Question", Image("plus").font(.headline)
//                    )
//
//                }
//
//            )
//        VStack{
//            DisclosureGroup("Question"){
//                VStack{
//                    Text("Lorem ipsum dolor sit amet consctetur. Turpis mauris tellus donec cursus erta arcu. Laculis pellentesque")
//                }
//            }.padding()
//        }
//    }
//}

struct FaqView: View {
    var body: some View {
        NavigationStack {
            Group {
                VStack {
                    Image("Logo")
                        .resizable()
                        .frame(width: 264, height: 102, alignment: .topLeading)
                    //                .imageScale(.large)
                        .padding(.vertical, 20)
                    
                    Text("Lorem ipsum dolor sit amet consctetur. Turpis mauris tellus donec cursus erta arcu. Laculis pellentesque")
                        .frame(width: 303, height: 66, alignment: .center)
                        .lineLimit(4)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20)
                    
                    Text("Frequently Asked Questions") .bold()
                        .frame(width: 303, height: 22, alignment: .leading)
                        .padding(.bottom, 20)
                    ScrollView{
                        VStack{
                            DisclosureGroup(
                                content: { AnswerView()
                                    
                                },
                                label: {
                                    Label(
                                        "Question0 Click here for answer", systemImage: "plus").font(.headline)
                                        .foregroundColor(.black)
                                        .frame(width: 377, height: 39, alignment: .leading)
                                        .background(Color(red: 255/255, green: 255/255, blue: 255/255))
                                        .foregroundColor(.black)
                                        .clipShape(Capsule())
                                        .padding(.all,8)
                                    
                                }
                                
                                
                                
                            ).padding(.leading)
                            DisclosureGroup(
                                content: { AnswerView()
                                    
                                },
                                label: {
                                    Label(
                                        "Question1 Click here for answer", systemImage: "plus").font(.headline)
                                        .foregroundColor(.black)
                                        .frame(width: 377, height: 39, alignment: .leading)
                                        .background(Color(red: 255/255, green: 255/255, blue: 255/255))
                                        .foregroundColor(.black)
                                        .clipShape(Capsule())
                                        .padding(.all,8)
                                    
                                }
                                
                                
                                
                            ).padding(.leading)
                            DisclosureGroup(
                                content: { AnswerView()
                                    
                                },
                                label: {
                                    Label(
                                        "Question2 Click here for answer", systemImage: "plus").font(.headline)
                                        .foregroundColor(.black)
                                        .frame(width: 377, height: 39, alignment: .leading)
                                        .background(Color(red: 255/255, green: 255/255, blue: 255/255))
                                        .foregroundColor(.black)
                                        .clipShape(Capsule())
                                        .padding(.all,8)
                                    
                                }
                                
                                
                                
                            ).padding(.leading)
                            DisclosureGroup(
                                content: { AnswerView()
                                    
                                },
                                label: {
                                    Label(
                                        "Question3 Click here for answer", systemImage: "plus").font(.headline)
                                        .foregroundColor(.black)
                                        .frame(width: 377, height: 39, alignment: .leading)
                                        .background(Color(red: 255/255, green: 255/255, blue: 255/255))
                                        .foregroundColor(.black)
                                        .clipShape(Capsule())
                                        .padding(.all,8)
                                    
                                }
                                
                                
                                
                            ).padding(.leading)
                            DisclosureGroup(
                                content: { AnswerView()
                                    
                                },
                                label: {
                                    Label(
                                        "Question3 Click here for answer", systemImage: "plus").font(.headline)
                                        .foregroundColor(.black)
                                        .frame(width: 377, height: 39, alignment: .leading)
                                        .background(Color(red: 255/255, green: 255/255, blue: 255/255))
                                        .foregroundColor(.black)
                                        .clipShape(Capsule())
                                        .padding(.all,8)
                                    
                                }
                                
                                
                                
                            ).padding(.leading)
                            DisclosureGroup(
                                content: { AnswerView()
                                    
                                },
                                label: {
                                    Label(
                                        "Question3 Click here for answer", systemImage: "plus").font(.headline)
                                        .foregroundColor(.black)
                                        .frame(width: 377, height: 39, alignment: .leading)
                                        .background(Color(red: 255/255, green: 255/255, blue: 255/255))
                                        .foregroundColor(.black)
                                        .clipShape(Capsule())
                                        .padding(.all,8)
                                    
                                }
                                
                                
                                
                            ).padding(.leading)
                            
                        }
                        
                    }
                    NavigationLink(destination: DashboardView()) {
                        Text("Go to dashboard")
                    }.buttonStyle(OrangeButtonStyle())
                }
            }.background(Color("BackgroundColor"))
        }.navigationBarHidden(true)
    }
}

struct AnswerView: View {
    var body: some View {
        VStack{
            Text("Lorem ipsum dolor sit amet consctetur. Turpis mauris tellus donec cursus erta arcu. Laculis pellentesque")
        }
        
    }
    
}


struct FaqView_Previews: PreviewProvider {
    static var previews: some View {
        FaqView()
    }
}
