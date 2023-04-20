//
//  SignInView.swift
//  Service Master
//
//  Created by Tuan Le on 2023-03-26.
//

import SwiftUI
import GoogleSignInSwift
import _AuthenticationServices_SwiftUI
import FirebaseAuth

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isSignedIn: Bool = false
    @State private var invalidForm: Bool = false
    @State private var isError = false
    @State private var errorMessage = ""
    
    var body: some View {
        NavigationStack {
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
                        
                        Button(action: {
                            if email.isEmpty || password.isEmpty {
                                invalidForm = true
                            } else {
                                Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                                    if let error = error {
                                        isSignedIn = false
                                        isError = true
                                        errorMessage = error.localizedDescription
                                    } else {
                                        isSignedIn = true
                                    }
                                }
                            }
                        }, label: {
                            Text("Sign in").fontWeight(.semibold).foregroundColor(.black)
                        }).frame(width: geometryReader.size.width*0.9, height: geometryReader.size.height*0.05).background(
                            RoundedRectangle(cornerRadius: 33).fill(Color("ButtonColor"))
                        ).alert("Invalid form", isPresented: $invalidForm) {
                            Button("OK", role: .cancel) { }
                        }.alert(errorMessage, isPresented: $isError) {
                            Button("OK", role: .cancel) { }
                        }
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
            }}.background(Color("BackgroundColor")).navigationDestination(isPresented: $isSignedIn, destination: {ServicesView()})
        }.navigationBarHidden(true)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
