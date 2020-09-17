//
//  LoadingView.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 17/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    @State private var largeArcAngle: Double = 0
    @State private var smallArcAngle: Double = 360
    
    let size: CGFloat = 72;
    
    var body: some View {
        ZStack {
            LargeSemiArcShape(x: self.size/2, y: self.size/2)
                .fill(Color(Theme.pink2))
                .rotationEffect(Angle.init(degrees: self.largeArcAngle))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
            SmallSemiArcShape(x: self.size/2, y: self.size/2)
                .fill(Color(Theme.pink2))
                .rotationEffect(Angle.init(degrees: self.smallArcAngle))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
        }
        .frame(width: self.size, height: self.size)
        .onAppear {
            self.largeArcAngle = 360
            self.smallArcAngle = 0
        }
    }
    
    struct LoadingView_Previews: PreviewProvider {
        static var previews: some View {
            LoadingView()
                .previewLayout(.fixed(width: 100, height: 100))
        }
    }
}
