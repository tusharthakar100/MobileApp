//
//  THistoryPresenter.swift
//  Tendable
//
//  Created by KranTush on 11/06/24.
//

import Foundation

class THistoryPresenter: BasePresenter
{
    @Published var inspectors:[Inspectors]
    
    override init() {
        self.inspectors = []
    }
    
    func getInspector()
    {
        inspectors = CoreDataHelper.shared.getAllData()
    }
}
