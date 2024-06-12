//
//  TLoginPresenter.swift
//  Tendable
//
//  Created by KranTush on 11/06/24.
//

import Foundation
import SwiftUI
import Combine

class TLoginPresenter: BasePresenter
{
    @Published var username: String = ""
    @Published var password: String = ""

    @ObservedObject var router: TLoginRouter
    @ObservedObject var interactor: TLoginInteractor

    var anyCancellable: AnyCancellable? = nil

    init(router: TLoginRouter, interactor: TLoginInteractor)
    {
        self.router = router
        self.interactor = interactor
        
        super.init()

        anyCancellable = router.objectWillChange.sink { [weak self] (_) in
            DispatchQueue.main.async {
                self?.objectWillChange.send()
            }
        }
        
    }
    
    func authenticate()
    {
        if(username.isEmpty || password.isEmpty)
        {
            self.showAlert(title: "Validation Error", message: "Please enter username and password")
            return
        }
        
        displayLoader()
        NetworkHelper.shared.loginReqeust(username: username, password: password) {[weak self] (loginResponse, networkEnum) in
            
            self?.hideLoader()
            if(networkEnum == .Valid)
            {
                self?.router.goToHome = true
            }else
            {
                self?.showAlert(title: "Server Error", message: "Username or password not valid")
            }
        }
    
    }
    
}
