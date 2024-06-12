//
//  CoreDataHandler.swift
//  Tendable
//
//  Created by KranTush on 10/06/24.
//

import Foundation
import SwiftUI
import CoreData

class CoreDataHandler
{
    let viewContext = PersistenceController.shared.container.viewContext

    func saveDataModel()
    {
        do{
            try viewContext.save()
        }catch let error
        {
            print(error);
        }
    }
    
    func getNewDataModel<T>() -> T where T: BaseModel{
        
        return BaseModel() as! T
    }
    
    func getDataModel<T>(id: String) -> T where T: BaseModel{
        
        return BaseModel() as! T
    }
    
    func fetchInspector() -> [Inspectors]
    {
        var request = NSFetchRequest<NSFetchRequestResult>(entityName: "Inspectors")
        
        let result = try? viewContext.fetch(request)
        
        return (result as? [Inspectors])!
    }
    
    func addInspectors(inspectionModel: Inspections)
    {
        var inspection = Inspectors(context: viewContext)
        
        inspection.name = inspectionModel.inspection.area.name
        inspection.access = inspectionModel.inspection.inspectionType.access
        inspection.id = Int64(inspectionModel.inspection.id)
        
        for (_, item) in inspectionModel.inspection.survey.categories.enumerated()
        {
            inspection.catgories?.name = item.name
            inspection.catgories?.id = Int64(item.id)
            
            for (_, item) in item.questions.enumerated()
            {
                inspection.catgories?.questions?.name = item.name
                inspection.catgories?.questions?.id = Int64(item.id)
                inspection.catgories?.questions?.choice = 0
                
                
                for(_, answers) in item.answerChoices.enumerated()
                {
                    inspection.catgories?.questions?.answers?.id = Int64(answers.id)
                    inspection.catgories?.questions?.answers?.name = answers.name
                    inspection.catgories?.questions?.answers?.score = answers.score
                }
            }
        }
        saveDataModel()
    }
}
