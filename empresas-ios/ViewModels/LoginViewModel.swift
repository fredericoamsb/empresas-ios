//
//  LoginViewModel.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 14/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published private(set) var showPassword: Bool = false
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var hasError: Bool = false
    
    func togglePasswordVisibility () -> Void {
        self.showPassword = !self.showPassword
    }
    
    func login () -> Void {
        self.isLoading = true
        LoginService.login(email: self.email, password: self.password) { (response, err) in
        self.isLoading = false
            if (response != nil) {
                self.hasError = false;
                print("navigate to next page")
            } else {
                self.hasError = true
            }
        }
    }
}
