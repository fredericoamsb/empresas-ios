//
//  LoadingView.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 14/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    @State private var largeArcAngle: Double = 0
    @State private var smallArcAngle: Double = 360
    
    var body: some View {
        GeometryReader { view in
            ZStack {
                LargeSemiArcShape(x: view.size.width/2, y: view.size.height/2)
                    .fill(Color(Theme.pink2))
                    .rotationEffect(Angle.init(degrees: self.largeArcAngle))
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                SmallSemiArcShape(x: view.size.width/2, y: view.size.height/2)
                    .fill(Color(Theme.pink2))
                    .rotationEffect(Angle.init(degrees: self.smallArcAngle))
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
            }
        }
        .background(Color.black.opacity(0.5))
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            self.largeArcAngle = 360
            self.smallArcAngle = 0
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
