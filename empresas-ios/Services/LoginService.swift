//
//  LoginService.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 14/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import Foundation

class LoginService {
    
    static func login (email: String, password: String, callback: @escaping (LoginResponse?, Error?) -> Void) {
        
        let json: [String: String] = [
            "email": email,
            "password": password
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        let url = URL(string: "\(APIConfig.url)/users/auth/sign_in")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-type")
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                callback(nil, error)
                return
            }
            
            do {
                let httpResponse = response as! HTTPURLResponse
                let uid = httpResponse.allHeaderFields["uid"] as? String
                let client = httpResponse.allHeaderFields["client"] as? String
                let accessToken = httpResponse.allHeaderFields["access-token"] as? String
                
                LocalStorage.saveSession(dict: ["uid": uid, "client": client, "access-token": accessToken] as? [String : String])
                
                let responseData: LoginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                callback(responseData, nil)
            } catch let err {
                callback(nil, err)
                return
            }
        }
        
        task.resume()
    }
}
