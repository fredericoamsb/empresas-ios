//
//  LoginService.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 15/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import Foundation

class EnterprisesService {
    
    static func filter (name: String, uid: String, callback: @escaping ([Enterprise]?, Error?) -> Void) {
        
        let url = URL(string: "\(APIConfig.url)/enterprises?name=\(name)")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("access-token", forHTTPHeaderField: "IBAQZsEQpIxeU__BfWJhYA")
        request.addValue("client", forHTTPHeaderField: "zo3Hsulcv2tMBV7utZKRjw")
        request.addValue("uid", forHTTPHeaderField: uid)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                callback(nil, error)
                return
            }
            
            do {
                let response: [Enterprise] = try JSONDecoder().decode([Enterprise].self, from: data)
                callback(response, nil)
            } catch let err {
                callback(nil, err)
                return
            }
        }
        
        task.resume()
    }
}
