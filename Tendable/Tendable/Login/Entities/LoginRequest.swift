//
//  LoginRequest.swift
//  Tendable
//
//  Created by KranTush on 10/06/24.
//

import Foundation

struct LoginRequest: Encodable
{
    let email, password: String
}

// MARK: - LoginResponse
struct LoginResponse: Codable {
    let error: String
}
