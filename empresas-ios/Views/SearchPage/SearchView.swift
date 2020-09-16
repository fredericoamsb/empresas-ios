//
//  SearchView.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 15/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        GeometryReader { view in
            NavigationView {
                
                VStack {
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [.init(Theme.gradientPink1), .init(Theme.gradientPink2), .init(Theme.gradientPink3)]), startPoint: .bottomLeading, endPoint: .topTrailing)
                            .frame(width: view.size.width, height: 188)
                        
                        VStack {
                            Spacer()
                            
                            HStack {
                                Image("search-icon")
                                    .foregroundColor(Color(Theme.gray3))
                                Spacer(minLength: 15)
                                TextField("Pesquise por empresa", text: self.$viewModel.search) {
                                    print(self.viewModel.search)
                                }
                            }
                            .font(.custom("Rubik Light", size: 18))
                            .accentColor(Color(Theme.pink1))
                            .padding()
                            .frame(width: view.size.width - 25, height: 50)
                            .background(Color(Theme.gray1))
                            .cornerRadius(4)
                            .offset(y: 25)
                        }
                        .frame(width: view.size.width, height: 200)
                    }
                    .zIndex(1)
                    
                    List {
                        ForEach(self.viewModel.Enterprises, id: \.self) { index in
                            EnterpriseItem(name: self.viewModel.Enterprises[0].name!)
                                .frame(width: view.size.width - 100, height: 188, alignment: .center)
                                .background(Color.red)
                        }
                    }
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .zIndex(0)
                .onAppear() {
                    UITableView.appearance().separatorStyle = .none
                }
                .onDisappear() {
                    UITableView.appearance().separatorStyle = .singleLine
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel())
    }
}
