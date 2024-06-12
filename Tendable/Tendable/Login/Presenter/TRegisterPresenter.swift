//
//  TRegisterPresenter.swift
//  Tendable
//
//  Created by KranTush on 11/06/24.
//

import Foundation

class TRegisterPresenter: BasePresenter
{
    @Published var firstName:String = ""
    @Published var lastName:String = ""
    @Published var email:String = ""
    @Published var password:String = ""
    @Published var confirmPassword:String = ""
    @Published var showAlert: Bool = false;
    @Published var alertData:(String, String) = (message:"", title:"")
    
    func registerUser(callback:@escaping ()->Void)
    {
        if(!validateInputs())
        {
            self.showAlert(message: "Invalid Input, Please enter valid input", title: "Validation Error")
            return
        }
            
        displayLoader()
        NetworkHelper.shared.registerReqeust(username: email, password: password) {[weak self] response, networkEnum in
            
            self?.hideLoader()
            if(networkEnum == .Valid)
            {
                //registered
                callback()
                
            }else
            {
                //error
                self?.showAlert(message: "Invalid Response, Please enter valid input", title: "Server Error")
                
            }
        }
    }
    
    func validateInputs() -> Bool
    {
        if(email.isEmpty || password.isEmpty || firstName.isEmpty || lastName.isEmpty)
        {
            showAlert(title: "Validation Error", message: "All input fields are mandatory")
            return false
        }
        
        if(password != confirmPassword)
        {
            showAlert(title: "Validation Error", message: "Password not matching, Please confirm your password")
            return false
        }
        
        return true
    }
    
    private func showAlert(message: String, title: String)
    {
        DispatchQueue.main.async {
            self.alertData = (message: message, title: title)
            self.showAlert = true
        }
    }
}
