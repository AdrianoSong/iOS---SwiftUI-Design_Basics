//
//  DetailView.swift
//  SwiftUIBasics
//
//  Created by Song on 13/08/20.
//  Copyright © 2020 Adriano Song. All rights reserved.
//

import SwiftUI

struct DetailView: View {

    @State private var fullImage = false

    var body: some View {
        GeometryReader { gr in
            VStack {
                Text("Detail Screen")
                    .font(.system(size: 28, weight: .bold))
                Image("cumbuco")
                    .resizable()
                    .frame(width: self.fullImage ? 600 : gr.size.width - 40,
                           height: self.fullImage ? 400 : 200, alignment: .center)
                    .cornerRadius(8)
                    .shadow(radius: 8)
                Button(action: {
                    withAnimation {
                        self.fullImage.toggle()
                    }
                }, label: {
                    Image(systemName: self.fullImage ?
                        "chevron.up" : "chevron.down").font(.title)
                }).padding(.top, 16)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                    .font(.system(size: 20, weight: .medium))
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
