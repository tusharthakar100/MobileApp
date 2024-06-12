//
//  TRegisterView.swift
//  Tendable
//
//  Created by KranTush on 11/06/24.
//

import SwiftUI

struct TRegisterView: View {
    
    @StateObject var presenter = TRegisterPresenter()
    @Binding var back: Bool;

    var body: some View {
        
        VStack(spacing: 20)
        {

            Text("Hey, Register with").padding(EdgeInsets(top: 20, leading: 0, bottom: 30, trailing: 0)).fontWeight(.bold)
            
            Image("login_icon")
            
            TTextfield(placeholder: UIConstants.firstNamePlaceholder, text: $presenter.firstName)
            
            TTextfield(placeholder: UIConstants.lastName, text: $presenter.lastName)
            
            TTextfield(placeholder: UIConstants.usernamePlaceholder, kebordType: .emailAddress, text: $presenter.email)
            
            TSecureField(placeholder: UIConstants.passwordPlaceholder, text: $presenter.password)
            
            TSecureField(placeholder: UIConstants.confirmPassword, text: $presenter.confirmPassword)
            
            
            TButton(title: UIConstants.registerBtnTitle) {
                
                presenter.registerUser {
                    back = false;
                }
            }.alert(presenter.alertData.1, isPresented: $presenter.showAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(presenter.alertData.0)
            }

            Spacer()
            
        }.modifier(TBackgroundView(showLoader: $presenter.showLoader))
            .navigationBarBackButtonHidden(true)
    }
}

struct TRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        
        TRegisterView(back: .constant(false))
    }
}
