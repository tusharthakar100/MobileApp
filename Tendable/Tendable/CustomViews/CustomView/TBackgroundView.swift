//
//  TBackgroundView.swift
//  Tendable
//
//  Created by KranTush on 11/06/24.
//

import SwiftUI

struct TBackgroundView: ViewModifier {
    
    @Binding var showLoader:Bool
    @Environment (\.alert) var alert
    func body(content: Content) -> some View {
        
        ZStack{
            content.padding(16)
                .background(UIConstants.appColor)
                .alert(alert.title, isPresented: alert.isShowAlert) {
                    Button("OK", role: .cancel) {
                        
                    }
                } message: {
                    Text(alert.message)
                }
            
            
            if(showLoader)
            {
                VStack{
                    Spacer()
                    HStack(spacing: 20)
                    {
                        Spacer()
                        ProgressView()
                            .progressViewStyle(.circular)
                            .tint(Color.init(white: 1, opacity: 1))
                            .scaleEffect(2.0)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10).frame(width: 60, height: 60)
                            }
                        Spacer()
                    }
                    Spacer()
                }.background(Color.gray)
                    .opacity(0.6)
            }
        }
    }
}
