//
//  ContentViewModel.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 16/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import Foundation

class BaseViewModel: ObservableObject {
    
    @Published var isAuth: Bool = false
    
    init() {
        self.isAuth = LocalStorage.getSession() != nil
    }
    
}
