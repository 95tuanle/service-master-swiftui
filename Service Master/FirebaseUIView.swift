//
//  FirebaseUIView.swift
//  Service Master
//
//  Created by Tuan Le on 2023-04-19.
//

import SwiftUI
//import FirebaseAuth
//import FirebaseAuthUI
//import SafariServices
//import FirebaseEmailAuthUI
//import FirebaseGoogleAuthUI
//
//struct FirebaseUIView: View {
//    @State private var viewState = CGSize(width: 0, height: screenHeight)
//    @State private var MainviewState = CGSize.zero
//
//    var body: some View {
//        ZStack {
//            Text("Hello, World!")
//            CustomLoginViewController { (error) in
//                if error == nil {
//                    self.status()
//                }
//            }.offset(y: self.MainviewState.height)
//        }.navigationBarHidden(true)
//    }
//
//    func status() {
//        self.viewState = CGSize(width: 0, height: 0)
//        self.MainviewState = CGSize(width: 0, height: screenHeight)
//    }
//}
//
//struct FirebaseUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        FirebaseUIView()
//    }
//}
//
//public var screenWidth: CGFloat {
//    return UIScreen.main.bounds.width
//}
//
//public var screenHeight: CGFloat {
//    return UIScreen.main.bounds.height
//}
//
//
//struct CustomLoginViewController : UIViewControllerRepresentable {
//
//    var dismiss : (_ error : Error? ) -> Void
//
//    func makeCoordinator() -> CustomLoginViewController.Coordinator {
//        Coordinator(self)
//    }
//
//    func makeUIViewController(context: Context) -> UIViewController {
//        let authUI = FUIAuth.defaultAuthUI()
//
//        let providers : [FUIAuthProvider] = [
//            FUIEmailAuth()
////            FUIGoogleAuth()
//        ]
//
//        authUI?.providers = providers
//        authUI?.delegate = context.coordinator
//
//        let authViewController = authUI?.authViewController()
//
//        return authViewController!
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<CustomLoginViewController>) {
//
//    }
//
//    //coordinator
//    class Coordinator : NSObject, FUIAuthDelegate {
//        var parent : CustomLoginViewController
//
//        init(_ customLoginViewController : CustomLoginViewController) {
//            self.parent = customLoginViewController
//        }
//
//        // MARK: FUIAuthDelegate
//        func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
//            if let error = error {
//                parent.dismiss(error)
//            } else {
//                parent.dismiss(nil)
//            }
//        }
//
//        func authUI(_ authUI: FUIAuth, didFinish operation: FUIAccountSettingsOperationType, error: Error?) {
//        }
//    }
//}
