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
                    SearchHeaderView(viewModel: self.viewModel, width: view.size.width)
                        .zIndex(1)
                    
                    if (self.viewModel.notFound) {
                        Spacer()
                        Text("Nenhum resultado encontrado")
                            .font(.custom("Rubik Light", size: 18))
                            .foregroundColor(Color(Theme.gray3))
                        Spacer()
                    } else {
                        List {
                            Section() {
                                if (self.viewModel.search != "") {
                                    Text("\(self.viewModel.count) resultados encontrados")
                                        .font(.custom("Rubik Light", size: 14))
                                        .foregroundColor(Color(Theme.gray3))
                                        .padding(.top, 30)
                                        .padding(.bottom, 10)
                                }
                            }
                            
                            Section() {
                                ForEach(self.viewModel.enterprises as [Enterprise], id: \.self) { enterprise in
                                    EnterpriseItem(photo: "\(APIConfig.host)\(enterprise.photo)", name: enterprise.name, width: view.size.width)
                                }
                            }
                            
                            Spacer()
                                .frame(width: 0, height: 30)
                        }
                    }
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
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
        SearchView(viewModel: SearchViewModel(baseViewModel: BaseViewModel()))
    }
}
