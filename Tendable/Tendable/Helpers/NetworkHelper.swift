//
//  NetworkHelper.swift
//  Tendable
//
//  Created by KranTush on 10/06/24.
//

import Foundation

class NetworkHelper
{
    static let shared = NetworkHelper()
    typealias Callback<T> = (T?, NetworkErrorsEnum) -> ()
    
    private init(){}
    
    func loginReqeust(username: String, password: String, callback:@escaping Callback<LoginResponse>)
    {
        let loginRequest = LoginRequest(email: username, password: password)
        
        guard let request = POSTRequest(url: Constants.loginUrl, model: loginRequest) else
        {
            callback(nil, .RequestNotValid)
            return
        }
        
        fireRequest(request: request, callback: callback)
    }
    
    func registerReqeust(username: String, password: String, callback:@escaping Callback<LoginResponse>)
    {
        let loginRequest = LoginRequest(email: username, password: password)
        
        guard let request = POSTRequest(url: Constants.registerUrl, model: loginRequest) else
        {
            callback(nil, .RequestNotValid)
            return
        }
        
        fireRequest(request: request, callback: callback)
    }
    
    
    func startInspection(callback:@escaping Callback<Inspections>)
    {
        guard let request = GETRequest(url: Constants.inspectionStartUrl) else
        {
            callback(nil, .RequestNotValid)
            return
        }
        
        fireRequest(request: request, callback: callback) 
    }
}

extension NetworkHelper
{
    private func GETRequest(url:String) -> URLRequest?
    {
        guard let url = URL(string: url) else {
            return nil
        }
        
        return URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
    }
    
    
    private func POSTRequest<T:Encodable>(url:String, model: T) -> URLRequest?
    {
        guard let url = URL(string: url) else {
            return nil
        }
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(model)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        print(String(data:request.httpBody!, encoding: .utf8))
        
        return request;
    }
    
    private func fireRequest<T:Decodable>(request: URLRequest, callback:@escaping Callback<T>)
    {
        let handler = NetworkHandler()
        
        handler.fireRequest(url: request) { data, networkEnum in
            
            if(networkEnum == .Valid)
            {
                callback(try? JSONDecoder().decode(T.self, from: data!), .Valid)
            }else
            {
                callback(nil, networkEnum)
            }
        }
    }
}
