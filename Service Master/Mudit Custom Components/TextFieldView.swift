//
//  TextFieldView.swift
//  Final Project
//
//  Created by Mudit Dahiya on 2023-03-26.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var stateVar: String
    var placeholder: String
    var body: some View {
        TextField(placeholder, text: $stateVar)
            .autocorrectionDisabled()
            .frame(minHeight: 40, idealHeight: 40)
            .padding([.trailing, .leading])
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black)
            )
            .padding([.trailing, .leading])
    }
}

struct TextFieldView_Previews: PreviewProvider {
    @State static var state = ""
    static var previews: some View {
        TextFieldView(stateVar: $state, placeholder: "placeholder")
    }
}
