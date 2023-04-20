//
//  SignUpView.swift
//  Service Master
//
//  Created by Tuan Le on 2023-03-26.
//

import SwiftUI
import _AuthenticationServices_SwiftUI
import FirebaseAuth
//import GoogleSignInSwift

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmedPassword: String = ""
    @State private var isSignedUp = false
    @State private var invalidForm = false
    @State private var isError = false
    @State private var errorMessage = ""
    
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
                        Button(action: {
                            if email.isEmpty || password.isEmpty || confirmedPassword.isEmpty || password != confirmedPassword {
                                invalidForm = true
                            } else {
                                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                                    if let error = error {
                                        isSignedUp = false
                                        isError = true
                                        errorMessage = error.localizedDescription
                                    } else {
                                        isSignedUp = true
                                    }
                                }
                            }
                        }, label: {
                            Text("Sign up").fontWeight(.semibold).foregroundColor(.black)
                        }).frame(width: geometryReader.size.width*0.9, height: geometryReader.size.height*0.05).background(
                            RoundedRectangle(cornerRadius: 33).fill(Color("ButtonColor"))
                        ).alert("Invalid form", isPresented: $invalidForm) {
                            Button("OK", role: .cancel) { }
                        }.alert(errorMessage, isPresented: $isError) {
                            Button("OK", role: .cancel) { }
                        }
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
            }}.background(Color("BackgroundColor")).navigationDestination(isPresented: $isSignedUp, destination: {SignInView()})
        }.navigationBarHidden(true)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
