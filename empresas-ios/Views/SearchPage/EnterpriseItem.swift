//
//  EnterpriseItem.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 15/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import SwiftUI

struct EnterpriseItem: View {
    
    let photo: String
    let name: String
    let width: CGFloat
    
    var body: some View {
        ZStack {
            ImageView(withURL: self.photo)
            Text(self.name)
                .font(.custom("Rubik Bold", size: 22))
                .foregroundColor(Color.white)
                .shadow(radius: 3)
        }
        .listRowInsets(EdgeInsets(top: 0, leading: 15, bottom: 8, trailing: 0))
        .frame(width: self.width - 30, height: 120, alignment: .center)
        .background(Color.init(Theme.gray2))
        .cornerRadius(4)
        .foregroundColor(Color.white)
    }
}

struct EnterpriseItem_Previews: PreviewProvider {
    static var previews: some View {
        EnterpriseItem(photo: "https://picsum.photos/270/120", name: "Iosys", width: 300)
            .previewLayout(.fixed(width: 270, height: 120))
    }
}
