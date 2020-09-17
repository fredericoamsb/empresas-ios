//
//  ImageView.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 16/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import SwiftUI

struct ImageView: View {
    
    @ObservedObject var viewModel: ImageViewModel
    
    init(withURL url: String) {
        viewModel = ImageViewModel(urlString: url)
    }
    
    var body: some View {
        
        Image(uiImage: UIImage(data: self.viewModel.data) ?? UIImage())
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(withURL: "iosys-icon")
    }
}
