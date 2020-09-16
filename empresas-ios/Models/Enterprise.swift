//
//  Enterprise.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 15/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

struct Enterprise: Hashable, Decodable {
    let name: String?
    let enterpriseType: EnterpriseType?
    let description: String?
    let country: String?
    let photo: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "enterprise_name"
        case enterpriseType = "enterprise_type"
        case description
        case country
        case photo
    }
}
