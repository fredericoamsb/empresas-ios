//
//  Enterprises.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 16/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import Foundation

struct EnterprisesResponse: Hashable, Decodable {
    let enterprises: [Enterprise]?
}
