//
//  HeaderView.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 14/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import SwiftUI

struct HeaderView : View {
    
    let height: CGFloat
    let width: CGFloat
    
    var body: some View {
        RectangleWithRoundedBottomBorderShape(width: width, height: height)
            .fill(LinearGradient(gradient: Gradient(colors: [.init(0xA489A8), .init(0xB21780), .init(0xAC2295)]), startPoint: .bottomLeading, endPoint: .topTrailing))
            .frame(width: width, height: height)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(height: 200, width: 300)
            .previewLayout(.fixed(width: 300, height: 200))
    }
}
