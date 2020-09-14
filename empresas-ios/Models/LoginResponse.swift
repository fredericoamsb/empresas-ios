//
//  LoginResponse.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 14/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import Foundation

struct LoginResponse: Decodable {
    public let result: T?
    public let results: [T]?
    public let status: String?
    public let notice: String?
    public let jwt: String?
}
