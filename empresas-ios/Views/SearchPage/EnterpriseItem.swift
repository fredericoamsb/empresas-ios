//
//  EnterpriseItem.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 15/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import SwiftUI

struct EnterpriseItem: View {
    
    let name: String;
    
    var body: some View {
        Text(self.name)
    }
}

struct EnterpriseItem_Previews: PreviewProvider {
    static var previews: some View {
        EnterpriseItem(name: "Enterprise B")
    }
}
