//
//  SignUpView.swift
//  Service Master
//
//  Created by Tuan Le on 2023-03-26.
//

import SwiftUI
import _AuthenticationServices_SwiftUI
//import GoogleSignInSwift

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmedPassword: String = ""

    var body: some View {
        NavigationStack {
            GeometryReader{geometryReader in HStack {
                Spacer()
                VStack() {
                    Image("Logo").resizable().aspectRatio(contentMode: .fit).frame(width: geometryReader.size.width*0.6)
                    Text("Sign up").fontWeight(.semibold)
                    Spacer()
                    Image("SignIn")
                    Spacer()
                    Group {
                        TextField("Email", text: $email).textInputAutocapitalization(.never).disableAutocorrection(true).padding().background(.white).cornerRadius(33)
                        SecureField("Password", text: $password).textInputAutocapitalization(.never).disableAutocorrection(true).padding().background(.white).cornerRadius(33)
                        SecureField("Confirm password", text: $confirmedPassword).textInputAutocapitalization(.never).disableAutocorrection(true).padding().background(.white).cornerRadius(33)
                        NavigationLink(destination: SignInView()) {
                            Text("Sign up").fontWeight(.semibold).foregroundColor(.black)
                        }.frame(width: geometryReader.size.width*0.9, height: geometryReader.size.height*0.05).background(
                            RoundedRectangle(cornerRadius: 33).fill(Color("ButtonColor"))
                        )
                        HStack {
                            Text("Already have an account?")
                            NavigationLink(destination: SignInView()) {
                                Text("Sign in")
                            }
                        }
                    }
                    Spacer()
                    Group {
                        SignInWithAppleButton(onRequest: {_ in}, onCompletion: {_ in}).frame(height: geometryReader.size.height*0.05).cornerRadius(33)
    //                    GoogleSignInButton(scheme: .light, style: .wide, state: .normal, action: {}).cornerRadius(33)
                    }
                    Spacer()
                }.frame(width: geometryReader.size.width*0.9)
                Spacer()
            }}.background(Color("BackgroundColor"))
        }.navigationBarHidden(true)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
