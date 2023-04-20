//
//  BookingsView.swift
//  Service Master
//
//  Created by Tuan Le on 2023-04-20.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct BookingsView: View {
    let uid = Auth.auth().currentUser?.uid
    let query = Firestore.firestore().collection("bookings").whereField("uid", isEqualTo: Auth.auth().currentUser?.uid ?? "")
    @State var bookings: [Booking] = []
    
    var body: some View {
        NavigationStack {
            GeometryReader{geometryReader in VStack {
                Image("Logo").resizable().aspectRatio(contentMode: .fit).frame(width: geometryReader.size.width*0.6)
                HStack {
                    NavigationLink(destination: ServicesView()) {
                        Text("Services").fontWeight(.semibold).foregroundColor(.black)
                    }.frame(width: geometryReader.size.width*0.4, height: geometryReader.size.height*0.05).background(
                        RoundedRectangle(cornerRadius: 33).fill(Color("ButtonColor"))
                    )
                    NavigationLink(destination: DashboardView()) {
                        Text("Dashboard").fontWeight(.semibold).foregroundColor(.black)
                    }.frame(width: geometryReader.size.width*0.4, height: geometryReader.size.height*0.05).background(
                        RoundedRectangle(cornerRadius: 33).fill(Color("ButtonColor"))
                    )
                }
                List(bookings) { booking in
                    Section (header: Text(booking.service.mainServices)) {
                        Text(booking.postalCode)
                        Text(booking.address)
                        Text(booking.method)
                        Text(booking.email)
                        Text(booking.contactNumber)
                        Text(booking.province)
                        Text(booking.city)
                        Text(booking.description)
                        Text(booking.urgency)
                    }.listRowSeparator(.hidden)
                }.scrollContentBackground(.hidden)
            }}.background(Color("BackgroundColor"))
        }.navigationBarHidden(true).onAppear() {
            query.getDocuments(completion: { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        bookings.append(Booking(document.data()))
                    }
                }
            })
        }
    }
}

struct BookingsView_Previews: PreviewProvider {
    static var previews: some View {
        BookingsView()
    }
}
