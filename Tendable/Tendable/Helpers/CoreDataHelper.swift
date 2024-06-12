//
//  CoreDataHelper.swift
//  Tendable
//
//  Created by KranTush on 10/06/24.
//

import Foundation

class CoreDataHelper
{
    static let shared: CoreDataHelper = CoreDataHelper();
    
    func getAllData() -> [Inspectors] {
        
        let handler = CoreDataHandler()
        
        return handler.fetchInspector()
        
    }
    
    func saveInspector(inspector: Inspections)
    {
        let handler = CoreDataHandler()

        handler.addInspectors(inspectionModel: inspector)
    }
    
}
