//
//  UrgencyButtonTextView.swift
//  Final Project
//
//  Created by Mudit Dahiya on 2023-03-26.
//

import SwiftUI

struct UrgencyButtonTextView: View {
    var text: String = "Button"
    var bgColor: String = "appOrange"
    var fgColor: String = "black"
    var body: some View {
        Text(text)
            .padding()
            .foregroundColor(Color(fgColor))
            .fontWeight(.bold)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color(bgColor))
            )
            .padding([.leading, .trailing])
    }
}

struct UrgencyButtonTextView_Previews: PreviewProvider {
    static var previews: some View {
        UrgencyButtonTextView()
    }
}
