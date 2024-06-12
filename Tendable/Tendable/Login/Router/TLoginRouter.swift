//
//  TLoginRouter.swift
//  Tendable
//
//  Created by KranTush on 11/06/24.
//

import Foundation

class TLoginRouter: ObservableObject
{
    @Published var gotoRegister: Bool = false
    @Published var goToHome: Bool = false
    
    func navigateToRegister()
    {
        gotoRegister = true
    }
}
