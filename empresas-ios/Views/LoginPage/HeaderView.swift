//
//  HeaderView.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 14/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import SwiftUI

struct HeaderView : View {
    
    private let height: CGFloat = 235
    let width: CGFloat
    
    @State private var offsetY: CGFloat = 0
    @State private var showTitle: Bool = true
    
    var body: some View {
        ZStack {
            VStack {
                RectangleWithRoundedBottomBorderShape(width: width, height: height)
                .fill(LinearGradient(gradient: Gradient(colors: [.init(Theme.gradientPink1), .init(Theme.gradientPink2), .init(Theme.gradientPink3)]), startPoint: .bottomLeading, endPoint: .topTrailing))
                .frame(width: width, height: height)
            }
            .padding(.top, offsetY)
            
            VStack {
                Image("iosys-icon")
                
                if(showTitle) {
                    Spacer().frame(height: 16)
                    
                    Text("Seja bem vindo ao empresa!")
                        .font(.custom("Rubik Regular", size: 20))
                        .foregroundColor(Color.white)
                }
            }
        }
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
                withAnimation(.easeInOut(duration: 0.2)) {
                    self.offsetY = -100
                    self.showTitle = false
                }
            }
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
                withAnimation(.easeInOut(duration: 0.2)) {
                    self.offsetY = 0
                    self.showTitle = true
                }
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(width: 300)
            .previewLayout(.fixed(width: 300, height: 200))
    }
}
