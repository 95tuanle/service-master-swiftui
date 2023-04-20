//
//  Booking.swift
//  Service Master
//
//  Created by Tuan Le on 2023-04-20.
//

import Foundation


class Booking: ObservableObject, Identifiable {
    @Published var uid: String
    @Published var postalCode: String
    @Published var urgency: String
    @Published var description: String
    @Published var fullName: String
    @Published var address: String
    @Published var city: String
    @Published var province: String
    @Published var contactNumber: String
    @Published var email: String
    @Published var method: String
    @Published var service: Service
    
    init(_ booking: Dictionary<String, Any>) {
        self.uid = booking["uid"] as? String ?? ""
        self.postalCode = booking["postalCode"] as? String ?? ""
        self.urgency = booking["urgency"] as? String ?? ""
        self.description = booking["description"] as? String ?? ""
        self.fullName = booking["fullName"] as? String ?? ""
        self.address = booking["address"] as? String ?? ""
        self.city = booking["city"] as? String ?? ""
        self.province = booking["province"] as? String ?? ""
        self.contactNumber = booking["contactNumber"] as? String ?? ""
        self.email = booking["email"] as? String ?? ""
        self.method = booking["method"] as? String ?? ""
        self.service = Service(booking["service"] as! NSDictionary)
    }
    
    
    init() {
        uid = ""
        postalCode = ""
        urgency = ""
        description = ""
        fullName = ""
        address = ""
        city = ""
        province = ""
        contactNumber = ""
        email = ""
        method = ""
        service = Service()
    }
}
