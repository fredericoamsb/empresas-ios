//
//  RectangleWithRoundedBottomBorderShape.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 14/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import SwiftUI

struct RectangleWithRoundedBottomBorderShape: Shape {
    let width: CGFloat
    let height: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addRect(CGRect(x: 0, y: 0, width: width, height: height - width/7))
        
        path.move(to: CGPoint(x: 0, y: height - width/7))
        path.addCurve(to: CGPoint(x: width, y: height - width/7), control1: CGPoint(x: width/3, y: height + width/40), control2: CGPoint(x: width - width/3, y: height + width/40))
        
        return path
    }
}

struct RectangleWithRoundedBottomBorderShape_Previews: PreviewProvider {
    static var previews: some View {
        RectangleWithRoundedBottomBorderShape(width: 200, height: 200)
        .fill(LinearGradient(gradient: Gradient(colors: [.init(Theme.gradientPink1), .init(Theme.gradientPink2), .init(Theme.gradientPink3)]), startPoint: .bottomLeading, endPoint: .topTrailing))
        .frame(width: 200, height: 200)
        .previewLayout(.fixed(width: 200, height: 200))
    }
}
