//
//  TView.swift
//  Tendable
//
//  Created by KranTush on 10/06/24.
//

import SwiftUI

struct TViewModifier: ViewModifier {

    func body(content: Content) -> some View {
        
    }
}

extension View
{
    func modifier() -> some View{
        self.modifier(TViewModifier())
    }
}
