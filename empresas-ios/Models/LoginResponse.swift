//
//  LoginResponse.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 14/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

struct LoginResponse: Decodable {
    let success: Bool?
    let enterprise: String?
}
