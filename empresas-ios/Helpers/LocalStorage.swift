//
//  AppStorage.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 16/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import Foundation

class LocalStorage {
    
    static fileprivate let userDefaults = UserDefaults.standard
    
    static func saveSession(dict: [String: String]?) -> Void {
        guard let accessToken = dict?["access-token"] else { return }
        guard let client = dict?["client"] else { return }
        guard let uid = dict?["uid"] else { return }
        
        userDefaults.set(accessToken, forKey: "access_token")
        userDefaults.set(client, forKey: "client")
        userDefaults.set(uid, forKey: "uid")
    }
    
    static func getSession() -> [String: String]? {
        guard let accessToken = userDefaults.string(forKey: "access_token") else { return nil }
        guard let client = userDefaults.string(forKey: "client") else { return nil }
        guard let uid = userDefaults.string(forKey: "uid") else { return nil }
        
        return ["access-token": accessToken, "client": client, "uid": uid]
    }
    
    static func clear() -> Void {
        guard let domain = Bundle.main.bundleIdentifier else { return }
        userDefaults.removePersistentDomain(forName: domain)
    }
    
}
