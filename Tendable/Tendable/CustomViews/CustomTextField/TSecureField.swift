//
//  TSecureField.swift
//  Tendable
//
//  Created by KranTush on 11/06/24.
//

import SwiftUI

struct TSecureField: View {
    var placeholder:String
    @Binding var text: String
    var body: some View {
        SecureField(placeholder, text: $text)
            .padding(6)
            .overlay {
                RoundedRectangle(cornerRadius: 10, style: .circular)
                    .stroke(Color.black, lineWidth: 1)
            }
    }
}

struct TSecureField_Previews: PreviewProvider {
    static var previews: some View {
        TSecureField(placeholder: "Password", text: .constant("1234"))
    }
}
