//
//  LoginView.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 14/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject private var viewModel = LoginViewModel()
    
    var body: some View {
        GeometryReader { view in
            ZStack {
                VStack {
                    
                    ZStack {
                        HeaderView(height: 270, width: view.size.width)
                        
                        VStack {
                            Image("iosys-icon")
                            
                            Spacer().frame(height: 16)
                            
                            Text("Seja bem vindo ao empresa!")
                                .font(.custom("Rubik Regular", size: 20))
                                .foregroundColor(Color.white)
                        }
                    }
                    
                    Spacer().frame(height: 24)
                    
                    Text("Email")
                        .font(.custom("Rubik Regular", size: 14))
                        .frame(width: view.size.width - 25, alignment: .leading)
                        .foregroundColor(Color(0x666666))
                    TextField("", text: self.$viewModel.username)
                        .font(.custom("Rubik Light", size: 16))
                        .autocapitalization(UITextAutocapitalizationType.none)
                        .accentColor(Color(0xE01E69))
                        .padding()
                        .frame(width: view.size.width - 25, height: 50)
                        .background(Color(0xf5f5f5))
                        .cornerRadius(4)
                    
                    Spacer().frame(height: 16)
                    
                    Text("Senha")
                        .font(.custom("Rubik Regular", size: 14))
                        .frame(width: view.size.width - 25, alignment: .leading)
                        .foregroundColor(Color(0x666666))
                    HStack {
                        if self.viewModel.showPassword {
                            TextField("", text: self.$viewModel.password)
                        } else {
                            SecureField("", text: self.$viewModel.password)
                        }
                        
                        Button(action: {
                            self.viewModel.togglePasswordVisibility()
                        }) {
                            Image(systemName: "eye")
                                .foregroundColor(Color(0x666666))
                        }
                    }
                    .font(.custom("Rubik Light", size: 16))
                    .autocapitalization(UITextAutocapitalizationType.none)
                    .accentColor(Color(0xE01E69))
                    .padding()
                    .frame(width: view.size.width - 25, height: 50)
                    .background(Color(0xf5f5f5))
                    .cornerRadius(4)
                    
                    Spacer()
                        .frame(height: 40)
                    
                    Button(action: {
                        print("User: \(self.viewModel.username)")
                        print("Pass: \(self.viewModel.password)")
                        self.viewModel.startLoading()
                    }) {
                        Text("ENTRAR")
                            .font(.custom("Rubik Medium", size: 16))
                            .frame(width: view.size.width - 28, height: 50)
                            .background(Color(0xE01E69))
                            .foregroundColor(Color.white)
                            .cornerRadius(8)
                    }
                }
                .frame(width: view.size.width, height: view.size.height, alignment: .top)
                .edgesIgnoringSafeArea(.top)
            }
            
            if self.viewModel.isLoading {
                LoaderView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
