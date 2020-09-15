//
//  LoginService.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 14/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import Foundation

class LoginService {
    
    static func login (email:String, password:String, callback: @escaping (LoginResponse?, Error?) -> Void) {
        
        guard let url = URL(string: "\(APIConfig.url)/users/auth/sign_in") else {return}
        
        var data: [String:Any] = [String:Any]()
        
        data = [
            "email": email,
            "password": password
        ]
        
        print(data)
        
        do {
            let data = try JSONSerialization.data(withJSONObject: data, options: [])
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = data
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")

            let task = URLSession.shared.dataTask(with: request)
            task.resume()
            print(data)
            let response: LoginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
            callback(response, nil)

            print(response)
        } catch let err {
            print(err)
            callback(nil, err)
            return
        }
    }
    
}
