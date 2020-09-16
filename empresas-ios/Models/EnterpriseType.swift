//
//  CompanyType.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 15/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

struct EnterpriseType: Hashable, Decodable {
    let id: Int?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name = "enterprise_type_name"
    }    
}
