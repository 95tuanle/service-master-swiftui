//
//  ForgotPasswordView.swift
//  Service Master
//
//  Created by Tuan Le on 2023-03-26.
//

import SwiftUI
import _AuthenticationServices_SwiftUI
import FirebaseAuth
import GoogleSignInSwift

struct ForgotPasswordView: View {
    @State private var email: String = ""
    @State private var isSubmittedReset: Bool = false
    @State private var invalidForm: Bool = false
    @State private var isError = false
    @State private var errorMessage = ""
    var body: some View {
        NavigationStack {
            GeometryReader {geometryReader in HStack {
                Spacer()
                VStack() {
                    Image("Logo").resizable().aspectRatio(contentMode: .fit).frame(width: geometryReader.size.width*0.6)
                    Text("Forgot password").fontWeight(.semibold)
                    Spacer()
                    Image("forgotPass")
                    Spacer()
                    Group {
                        TextField("Email", text: $email).textInputAutocapitalization(.never).disableAutocorrection(true).padding().background(.white).cornerRadius(33)
                        
                        NavigationLink(destination: SignInView()) {
                            Text("Want to sign in")
                        }
                        
                        Button(action: {
                            if email.isEmpty {
                                invalidForm = true
                            } else {
                                Auth.auth().sendPasswordReset(withEmail: email) { error in
                                    if let error = error {
                                        isSubmittedReset = false
                                        isError = true
                                        errorMessage = error.localizedDescription
                                    } else {
                                        isSubmittedReset = true
                                    }
                                }
                            }
                        }, label: {
                            Text("Reset password").fontWeight(.semibold).foregroundColor(.black)
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
            }}.background(Color("BackgroundColor")).navigationDestination(isPresented: $isSubmittedReset, destination: {SignInView()})
        }.navigationBarHidden(true)
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
