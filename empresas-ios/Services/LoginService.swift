//
//  LoginService.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 14/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import Foundation

class LoginService {
    
    func login (email:String, password:String, success: @escaping (LoginResponse?) -> Void, error: @escaping (Error?) -> Void) {
        
        guard let url = URL(string: "\(APIConfig.url)/users/auth/sign_in") else {return}
        
        let user: Credentials
        
        do {
            let data = try JSONSerialization.data(withJSONObject: self.user, options: [])
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = data
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")

            let task = URLSession.shared.dataTask(with: request)
            task.resume()

            let response: LoginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
            success(response)
            
        } catch let err {
            error(err)
            return
        }
    }
    
}
