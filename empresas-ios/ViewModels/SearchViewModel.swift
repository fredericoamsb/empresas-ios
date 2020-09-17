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
    @Published private(set) var notFound: Bool = false
    @Published private(set) var enterprises: [Enterprise] = []
    
    let baseViewModel: BaseViewModel
    
    init(baseViewModel: BaseViewModel) {
        self.baseViewModel = baseViewModel
    }
    
    func filter () -> Void {
        if (self.search == "") {
            self.enterprises = []
            self.notFound = false
            return
        }
        
        self.isLoading = true
        
        EnterprisesService.filter(name: self.search) { (searched, enterprisesResponse, statusCode, err) in
            DispatchQueue.main.async {
                self.isLoading = false

                if (statusCode == 401) {
                    LocalStorage.clear()
                    self.baseViewModel.isAuth = false
                    return
                }
                
                if (self.search == searched) {
                    self.enterprises = enterprisesResponse?.enterprises ?? []
                    self.count = self.enterprises.count
                    self.notFound = self.count == 0
                }
            }
        }
    }
}
