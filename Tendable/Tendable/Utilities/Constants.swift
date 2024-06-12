//
//  Constants.swift
//  Tendable
//
//  Created by KranTush on 10/06/24.
//

import Foundation

class Constants
{
    static let ServerUrl = "http://127.0.0.1:5001/api/"
    
    static let loginUrl = ServerUrl + "login"
    static let registerUrl = ServerUrl + "register"
    
    static let inspectionStartUrl = ServerUrl + "inspections/start"
    static let inspectionSubmitUrl = ServerUrl + "inspections/submit"
    static let inspectionRandomUrl = ServerUrl + "inspections/random_inspection"
}

extension Constants
{
    static func inspectionRandomUrl(number: Int) -> String
    {
        return ServerUrl + "inspections/generate_random_inspections/" + String(number)
    }
    
    static func inspectionFoundUrl(id: String) -> String
    {
        return ServerUrl + "inspections/" + id
    }
    
    static func inspectionDeleteUrl(id: String) -> String
    {
        return ServerUrl + "inspections/" + id
    }

}
