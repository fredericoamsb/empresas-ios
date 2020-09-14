//
//  RectangleWithRoundedBottomBorderShape.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 14/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import SwiftUI

struct SmallSemiArcShape: Shape {
    let x: CGFloat
    let y: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(center: CGPoint(x: x, y: y), radius: 47, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: true)

        return path.strokedPath(.init(lineWidth: 3))
    }
}

struct SmallSemiArcShape_Previews: PreviewProvider {
    static var previews: some View {
        SmallSemiArcShape(x: 100, y: 100)
            .fill(Color(0xFBDBE7))
            .previewLayout(.fixed(width: 200, height: 200))
    }
}
