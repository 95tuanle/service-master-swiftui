//
//  Service.swift
//  Service Master
//
//  Created by Tuan Le on 2023-04-20.
//

import Foundation


class Service: ObservableObject, Identifiable {
    let mainServices: String
    let description: String
    init() {
        self.mainServices = ""
        self.description = ""
    }
    init(_ service: NSDictionary) {
        self.mainServices = service["mainServices"] as? String ?? ""
        self.description = service["description"] as? String ?? ""
    }
}
