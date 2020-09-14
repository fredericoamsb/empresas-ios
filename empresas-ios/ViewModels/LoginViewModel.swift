//
//  LoginViewModel.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 14/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import Foundation

class LoginViewModel: ObservableObject{
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published private(set) var showPassword = false
    @Published private(set) var isLoading = false
    
    func togglePasswordVisibility () -> Void {
        self.showPassword = !self.showPassword
    }
    
    func startLoading () -> Void {
        self.isLoading = true
    }
    
    func stopLoading () -> Void {
        self.isLoading = false
    }
}
