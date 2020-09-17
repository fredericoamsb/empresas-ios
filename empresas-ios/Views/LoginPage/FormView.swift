//
//  FormView.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 14/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import SwiftUI

struct FormView: View {
    
    @EnvironmentObject var baseViewModel: BaseViewModel
    
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        GeometryReader { (view: GeometryProxy) in
            VStack {
                Text("Email")
                    .font(.custom("Rubik Regular", size: 14))
                    .frame(width: view.size.width - 25, alignment: .leading)
                    .foregroundColor(Color(Theme.gray3))
                HStack {
                    TextField("", text: self.$viewModel.email)
                        .keyboardType(.emailAddress)
                    if (self.viewModel.hasError) {
                        Image("error-icon")
                            .foregroundColor(Color(Theme.gray3))
                    }
                }
                .font(.custom("Rubik Light", size: 16))
                .autocapitalization(UITextAutocapitalizationType.none)
                .accentColor(Color(Theme.pink1))
                .padding()
                .frame(width: view.size.width - 25, height: 50)
                .background(Color(Theme.gray1))
                .border(Color.red, width: self.viewModel.hasError ? 2 : 0)
                .cornerRadius(4)
                
                Spacer().frame(height: 16)
                
                Text("Senha")
                    .font(.custom("Rubik Regular", size: 14))
                    .frame(width: view.size.width - 25, alignment: .leading)
                    .foregroundColor(Color(Theme.gray3))
                HStack {
                    if self.viewModel.showPassword {
                        TextField("", text: self.$viewModel.password)
                    } else {
                        SecureField("", text: self.$viewModel.password)
                    }
                    
                    if (self.viewModel.hasError) {
                        Image("error-icon")
                            .foregroundColor(Color(Theme.gray3))
                    } else {
                        Button(action: {
                            self.viewModel.togglePasswordVisibility()
                        }) {
                            Image("eye-icon")
                                .foregroundColor(Color(Theme.gray3))
                        }
                    }
                }
                .font(.custom("Rubik Light", size: 16))
                .autocapitalization(UITextAutocapitalizationType.none)
                .accentColor(Color(Theme.pink1))
                .padding()
                .frame(width: view.size.width - 25, height: 50)
                .background(Color(Theme.gray1))
                .border(Color.red, width: self.viewModel.hasError ? 2 : 0)
                .cornerRadius(4)
                
                Text("Credenciais incorretas")
                    .font(.custom("Rubik Light", size: 12))
                    .frame(width: view.size.width - 40, alignment: .trailing)
                    .foregroundColor(Color.red)
                    .opacity(self.viewModel.hasError ? 1 : 0)
                
                Spacer()
                    .frame(height: 40)
                
                Button(action: {
                    self.viewModel.login(baseViewModel: self.baseViewModel)
                }) {
                    Text("ENTRAR")
                        .font(.custom("Rubik Medium", size: 16))
                        .frame(width: view.size.width - 28, height: 50)
                        .background(Color(Theme.pink1))
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                }
            }
            .frame(width: view.size.width, height: view.size.height, alignment: .top)
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(viewModel: LoginViewModel())
            .previewLayout(.fixed(width: 300, height: 300))
    }
}
