//
//  TButton.swift
//  Tendable
//
//  Created by KranTush on 11/06/24.
//

import SwiftUI

struct TButton: View {
    
    var title:String
    var action:() -> Void
    var body: some View {
        
        HStack{
            Button.init(title, action: action)
                .padding(6)
                .frame(maxWidth: .greatestFiniteMagnitude)
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                }
                .foregroundColor(Color.black)
        }
            
    }
}

struct TButton_Previews: PreviewProvider {
    static var previews: some View {
        TButton(title: "Login", action: {
            
        })
    }
}
