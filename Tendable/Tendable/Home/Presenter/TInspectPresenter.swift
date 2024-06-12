//
//  TInspectPresenter.swift
//  Tendable
//
//  Created by KranTush on 11/06/24.
//

import Foundation
import SwiftUI

class TInspectPresenter: BasePresenter
{
    @Published var inspectionModel: Inspections?
    @Published var categories: [Category]
    
    override init() {
        
        categories = []
    }
    func getAllInspections()
    {
        displayLoader()
        NetworkHelper.shared.startInspection { [weak self] inspection, networkEnum in
            
            self?.hideLoader()
            if(networkEnum == .Valid)
            {
                print(inspection);
                
                DispatchQueue.main.async {
                    self?.inspectionModel = inspection
                    CoreDataHelper.shared.saveInspector(inspector: inspection!)
                    self?.categories = (inspection?.inspection.survey.categories)!
                }
            }
        }
    }
    
    func changeValue(index: IndexModel)
    {
        for i in 0...((self.categories[index.catIndex].questions[index.queIndex].answerChoices.count) - 1)
        {
            self.categories[index.catIndex].questions[index.queIndex].answerChoices[i].selected = false;
        }
        self.categories[index.catIndex].questions[index.queIndex].answerChoices[index.ansIndex].selected.toggle()
    }
    
    func submitInspection()
    {
        
    }
}
