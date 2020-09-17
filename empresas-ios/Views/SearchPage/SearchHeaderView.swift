//
//  HeaderView.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 16/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import SwiftUI

struct SearchHeaderView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    
    @State private var height: CGFloat = 188
    
    let width: CGFloat
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                HStack {
                    Image("search-icon")
                        .foregroundColor(Color(Theme.gray3))
                    Spacer(minLength: 15)
                    TextField("Pesquise por empresa", text: Binding<String>(
                        get: { self.viewModel.search },
                        set: {
                            self.viewModel.search = $0
                            self.viewModel.filter()
                    }))
                }
                .font(.custom("Rubik Light", size: 18))
                .accentColor(Color(Theme.pink1))
                .padding()
                .frame(width: self.width - 25, height: 50)
                .background(Color(Theme.gray1))
                .cornerRadius(4)
                .offset(y: 25)
            }
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.init(Theme.gradientPink1), .init(Theme.gradientPink2), .init(Theme.gradientPink3)]), startPoint: .bottomLeading, endPoint: .topTrailing)
                .frame(width: self.width)
        )
            .frame(width: self.width, height: self.height)
            .onAppear {
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
                    withAnimation(.easeInOut(duration: 0.2)) {
                        self.height = 67
                    }
                }
                
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
                    withAnimation(.easeInOut(duration: 0.2)) {
                        self.height = 188
                    }
                }
        }
    }
}

struct SearchHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SearchHeaderView(viewModel: SearchViewModel(baseViewModel: BaseViewModel()), width: 300)
            .previewLayout(.fixed(width: 300, height: 270))
    }
}
