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
