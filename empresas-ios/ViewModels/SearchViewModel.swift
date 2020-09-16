//
//  SearchViewModel.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 15/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    @Published var search: String = ""
    @Published private(set) var uid: String = "testeapple@ioasys.com.br"
    @Published private(set) var count: Int = 0
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var Enterprises: [Enterprise] = []

    func filter () -> Void {
        self.isLoading = true

        EnterprisesService.filter(name: self.search, uid: self.uid) { (response, err) in

            DispatchQueue.main.async {
                self.isLoading = false
                self.Enterprises = response!
            }
        }
    }
}
