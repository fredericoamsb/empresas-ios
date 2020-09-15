//
//  RectangleWithRoundedBottomBorderShape.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 14/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import SwiftUI

struct LargeSemiArcShape: Shape {
    let x: CGFloat
    let y: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(center: CGPoint(x: x, y: y), radius: 72, startAngle: .degrees(180), endAngle: .degrees(270), clockwise: true)

        return path.strokedPath(.init(lineWidth: 3))
    }
}

struct LargeSemiArcShape_Previews: PreviewProvider {
    static var previews: some View {
        LargeSemiArcShape(x: 100, y: 100)
            .fill(Color(Theme.pink2))
        .previewLayout(.fixed(width: 200, height: 200))
    }
}
