//
//  NavBarView.swift
//  Final Project
//
//  Created by Mudit Dahiya on 2023-03-24.
//

import SwiftUI

struct NavBarView: View {
    let one: String
    let two: String
    let three: String
    let four: String
    
    var body: some View {
        HStack(spacing: 0) {
            Image(one)
            Image(two)
            Image(three)
            Image(four)
        }
    }
}

struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarView(one:"black1", two: "black2", three: "black3", four: "black4")
    }
}
