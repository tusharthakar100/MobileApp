//
//  NetworkHandler.swift
//  Tendable
//
//  Created by KranTush on 10/06/24.
//

import Foundation

class NetworkHandler
{
    let session:URLSession
    
    typealias callback = (Data?, NetworkErrorsEnum) -> ()
    
    init()
    {
        session = URLSession(configuration: .default)
    }
    
    func fireRequest(url: URLRequest, callback: @escaping callback)
    {
       let task = session.dataTask(with: url) { data, response, error in
            
           if(self.handlerResponse(response: response, callback: callback))
           {
               self.handleData(data: data, callback: callback)
           }
        }
        task.resume();
    }
}

extension NetworkHandler
{
    private func handlerResponse(response: URLResponse?, callback: callback) -> Bool
    {
        guard let httpResponse = response as? HTTPURLResponse else
        {
            callback(nil, .ServerError)
            return false
        }
        
        if(httpResponse.statusCode == 404)
        {
            callback(nil, .Forbidden)
            return false
        }
        
        return true
    }
    
    private func handleData(data: Data?, callback: callback)
    {
        guard let responseData = data else
        {
            callback(nil, .InvalidResponse)
            return
        }
        
        callback(responseData, .Valid);
    }
}

