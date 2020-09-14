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
        
        path.addRect(CGRect(x: 0, y: 0, width: width, height: height - height/4))
        
        path.move(to: CGPoint(x: 0, y: height - height/4))
        path.addCurve(to: CGPoint(x: width, y: height - height/4), control1: CGPoint(x: height/2, y: height + height/40), control2: CGPoint(x: width - height/2, y: height + height/40))
        
        return path
    }
}

struct RectangleWithRoundedBottomBorderShape_Previews: PreviewProvider {
    static var previews: some View {
        RectangleWithRoundedBottomBorderShape(width: 200, height: 200)
        .fill(LinearGradient(gradient: Gradient(colors: [.init(0xA489A8), .init(0xB21780), .init(0xAC2295)]), startPoint: .bottomLeading, endPoint: .topTrailing))
        .frame(width: 200, height: 200)
        .previewLayout(.fixed(width: 200, height: 200))
    }
}
