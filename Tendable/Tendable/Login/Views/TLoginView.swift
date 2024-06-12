//
//  TLoginView.swift
//  Tendable
//
//  Created by KranTush on 10/06/24.
//

import SwiftUI

struct TLoginView: View {

    @ObservedObject var presenter:TLoginPresenter

    init(router: TLoginRouter, interactor: TLoginInteractor) {
        presenter = TLoginPresenter(router: router, interactor: interactor)
    }
    var body: some View {
        

        NavigationStack {
                
                VStack(alignment: .center, spacing: 20){
                    Spacer()
                    Spacer()
                    Image("login_icon")
                    
                    TTextfield(placeholder: UIConstants.usernamePlaceholder, kebordType: .emailAddress, text: $presenter.username)
                    
                    TSecureField(placeholder: UIConstants.passwordPlaceholder, text: $presenter.password)
                    
                    
                    GeometryReader { proxy in
                        HStack(alignment: .center, spacing: 0) {
                            
                            TButton(title: UIConstants.loginBtnTitle) {
                                presenter.authenticate()
                            }.frame(width: (proxy.size.width/2) - 8)
                                .navigationDestination(isPresented: $presenter.router.goToHome) {
                                    HomeView()
                                    
                                }
                            
                            Spacer()
                            TButton(title: UIConstants.registerBtnTitle) {
                                presenter.router.gotoRegister = true
                            }.frame(width: (proxy.size.width / 2) - 8)
                                .navigationDestination(isPresented: $presenter.router.gotoRegister) {
                                    TRegisterView(back: $presenter.router.gotoRegister)
                                }
                        }
                        
                    }
                    
                    Spacer()
                }.modifier(TBackgroundView(showLoader: $presenter.showLoader))
                    .environment((\.alert), presenter.alert)
            
        }
    }
        
}

struct TLoginView_Previews: PreviewProvider {
    
    static var previews: some View {
        TLoginView(router: TLoginRouter(), interactor: TLoginInteractor())
    }
}
