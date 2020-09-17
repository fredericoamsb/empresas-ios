//
//  ContentView.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 15/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: BaseViewModel
    
    var body: some View {
        Group {
            if self.viewModel.isAuth {
                SearchView(viewModel: SearchViewModel(baseViewModel: viewModel))
            } else {
                LoginView(viewModel: LoginViewModel())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
