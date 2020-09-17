//
//  LoginService.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 15/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import Foundation

class EnterprisesService {
    
    static func filter (name: String, callback: @escaping (EnterprisesResponse?, Int?, Error?) -> Void) {
        
        let url = URL(string: "\(APIConfig.url)/enterprises?name=\(name)")!
        
        let dict = LocalStorage.getSession()
        let accessToken = dict?["access-token"]
        let client = dict?["client"]
        let uid = dict?["uid"]
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(accessToken!, forHTTPHeaderField: "access-token")
        request.addValue(client!, forHTTPHeaderField: "client")
        request.addValue(uid!, forHTTPHeaderField: "uid")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                callback(nil, nil, error)
                return
            }
            
            do {
                if (response.statusCode != 401) {
                    let enterprise: EnterprisesResponse = try JSONDecoder().decode(EnterprisesResponse.self, from: data)
                    callback(enterprise, response.statusCode, nil)
                } else {
                    callback(nil, response.statusCode, nil)
                }
            } catch let err {
                callback(nil, nil, err)
                return
            }
        }
        
        task.resume()
    }
}
