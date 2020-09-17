//
//  LoginView.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 14/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        GeometryReader { view in
            ZStack {
                VStack {
                    LoginHeaderView(width: view.size.width)
                    
                    Spacer().frame(height: 24)
                    
                    FormView(viewModel: self.viewModel)
                }
            }
        }
        .overlay(self.viewModel.isLoading ? LoadingOverlayView() : nil)
        .edgesIgnoringSafeArea(.top)
    }
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView(viewModel: LoginViewModel())
        }
    }
}
