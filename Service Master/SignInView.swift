//
//  SignInView.swift
//  Service Master
//
//  Created by Tuan Le on 2023-03-26.
//

import SwiftUI
import GoogleSignInSwift
import _AuthenticationServices_SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        GeometryReader{geometryReader in HStack {
            Spacer()
            VStack() {
                Image("Logo").resizable().aspectRatio(contentMode: .fit).frame(width: geometryReader.size.width*0.6)
                Text("Sign in").fontWeight(.semibold)
                Spacer()
                Image("SignIn")
                Spacer()
                Group {
                    TextField("Email", text: $email).textInputAutocapitalization(.never).disableAutocorrection(true).padding().background(.white).cornerRadius(33)
                    SecureField("Password", text: $password).textInputAutocapitalization(.never).disableAutocorrection(true).padding().background(.white).cornerRadius(33)
                    NavigationLink(destination: ForgotPasswordView()) {
                        Text("Forgot password")
                    }
                    NavigationLink(destination: Dashboard1View()) {
                        Text("Sign in").fontWeight(.semibold).foregroundColor(.black)
                    }.frame(width: geometryReader.size.width*0.9, height: geometryReader.size.height*0.05).background(
                        RoundedRectangle(cornerRadius: 33).fill(Color("ButtonColor"))
                    )
                    HStack {
                        Text("Don't have an account?")
                        NavigationLink(destination: SignUpView()) {
                            Text("Sign up")
                        }
                    }
                }
                Spacer()
                Group {
                    SignInWithAppleButton(onRequest: {_ in}, onCompletion: {_ in}).frame(height: geometryReader.size.height*0.05).cornerRadius(33)
                    GoogleSignInButton(scheme: .light, style: .wide, state: .normal, action: {}).cornerRadius(33)
                }
                Spacer()
            }.frame(width: geometryReader.size.width*0.9)
            Spacer()
        }}.background(Color("BackgroundColor")).navigationBarHidden(true)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
