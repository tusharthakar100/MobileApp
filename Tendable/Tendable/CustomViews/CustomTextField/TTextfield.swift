//
//  TTextfield.swift
//  Tendable
//
//  Created by KranTush on 11/06/24.
//

import SwiftUI

struct TTextfield: View {
    
    var placeholder:String
    var kebordType: UIKeyboardType = .alphabet
    @Binding var text: String
    var body: some View {
        TextField(placeholder, text: $text)
            .keyboardType(kebordType)
            .padding(6)
            .overlay {
                RoundedRectangle(cornerRadius: 10, style: .circular)
                    .stroke(Color.black, lineWidth: 1)
            }
    }
}

struct TTextfield_Previews: PreviewProvider {
    static var previews: some View {
        
        let username = "tushar"
        let placeholder = "Username"
        TTextfield(placeholder: placeholder, text:.constant(username))
    }
}
