//
//  LoadingView.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 14/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import SwiftUI

struct LoadingOverlayView: View {    
    var body: some View {
        GeometryReader { view in
            LoadingView()
                .frame(width: view.size.width, height: view.size.height)
        }
        .background(Color.black.opacity(0.5))
        .edgesIgnoringSafeArea(.all)
    }
}

struct LoadingOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingOverlayView()
    }
}
