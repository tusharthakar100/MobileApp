//
//  TendableApp.swift
//  Tendable
//
//  Created by KranTush on 10/06/24.
//

import SwiftUI

@main
struct TendableApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            var router = TLoginRouter()
            var interactor = TLoginInteractor()
            TLoginView(router: router, interactor: interactor).environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
