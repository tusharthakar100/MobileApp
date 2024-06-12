//
//  BasePresenter.swift
//  Tendable
//
//  Created by KranTush on 10/06/24.
//

import Foundation

class BasePresenter: ObservableObject
{
    @Published var alert: AlertModel = AlertModel()
    @Published var showLoader:Bool = false;
    func showAlert(title:String, message: String)
    {
        DispatchQueue.main.async {
            self.alert = AlertModel()
            self.alert.message = message
            self.alert.title = title
            self.alert.isShowAlert = .constant(true)
        }
    }
    
    func displayLoader()
    {
        DispatchQueue.main.async {
            self.showLoader = true;
        }
    }
    
    func hideLoader()
    {
        DispatchQueue.main.async {
            self.showLoader = false
        }
    }
}
