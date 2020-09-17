//
//  EnterpriseView.swift
//  empresas-ios
//
//  Created by Frederico Augusto on 17/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import SwiftUI

struct EnterpriseView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let photo: String
    let name: String
    let description: String
    
    var body: some View {
        GeometryReader { (view: GeometryProxy) in
            VStack (spacing: 0) {
                HStack {
                    Spacer()
                        .frame(width: 16)
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("arrow-left")
                            .renderingMode(.original)
                            .frame(width: 40, height: 40)
                            .background(Color(Theme.gray1))
                            .cornerRadius(4)
                    }
                    Spacer()
                    Text(self.name)
                        .font(.custom("Rubik Bold", size: 28))
                        .foregroundColor(Color.black)
                    
                    Spacer()
                    Spacer()
                        .frame(width: 56)
                }
                .frame(height: 92)
                
                ZStack {
                    ImageView(withURL: self.photo)
                    Text(self.name)
                        .font(.custom("Rubik Bold", size: 22))
                        .foregroundColor(Color.white)
                        .shadow(radius: 3)
                }
                .frame(width: view.size.width, height: 120)
                .clipped()
                .background(Color.init(Theme.gray2))
                .foregroundColor(Color.white)
                
                ScrollView {
                    Text(self.description)
                        .padding()
                }
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct EnterpriseView_Previews: PreviewProvider {
    static var previews: some View {
        EnterpriseView(photo: "https://picsum.photos/270/120", name: "Iosys", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
    }
}
