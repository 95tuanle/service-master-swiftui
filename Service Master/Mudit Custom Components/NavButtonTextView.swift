//
//  NavButtonTextView.swift
//  Final Project
//
//  Created by Mudit Dahiya on 2023-03-26.
//

import SwiftUI

struct NavButtonTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .foregroundColor(.black)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, minHeight: 40, idealHeight: 40)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color("appOrange"))
            )
            .padding([.leading, .trailing])
    }
}

struct NavButtonTextView_Previews: PreviewProvider {
    static var previews: some View {
        NavButtonTextView(text: "Let's see")
    }
}
