//
//  TExtensions.swift
//  Tendable
//
//  Created by KranTush on 11/06/24.
//

import Foundation
import SwiftUI

extension EnvironmentValues
{
    var alert: AlertModel {
        get { self[AlertModel.self] }
        set { self[AlertModel.self] = newValue }
    }
}

class AlertModel: ObservableObject, EnvironmentKey
{
    static var defaultValue: AlertModel = AlertModel()
    
    @Published var isShowAlert: Binding<Bool> = .constant(false)
    @Published var title : String = ""
    @Published var message : String = ""
}

extension Binding {
    func unwrap<Wrapped>() -> Binding<Wrapped>? where Optional<Wrapped> == Value {
        guard let value = self.wrappedValue else { return nil }
        return Binding<Wrapped>(
            get: {
                return value
            },
            set: { value in
                self.wrappedValue = value
            }
        )
    }
}
