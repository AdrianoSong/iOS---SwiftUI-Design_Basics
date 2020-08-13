//
//  BottomMenuView.swift
//  SwiftUIBasics
//
//  Created by Song on 30/07/20.
//  Copyright © 2020 Adriano Song. All rights reserved.
//

import SwiftUI

struct BottomMenuView: View {

    @State private var showMenu = false

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 16) {
                Text("Bottom Menu").font(.largeTitle)
                Text("Show menu").font(.title).foregroundColor(.gray)
                Button(action: {
                    self.showMenu.toggle()
                }, label: {
                    Text("Open menu")
                })
                Spacer()

                VStack(spacing: 16) {
                    HStack { Spacer() }
                    Image(systemName: "line.horizontal.3").font(.title).foregroundColor(.white)
                    Text("My Menu!").font(.title).foregroundColor(.white)
                    Spacer()
                }
                .frame(height: 200)
                .background(Color.blue)
                .cornerRadius(8)
                .padding([.leading, .trailing], 16)
                .offset(y: self.showMenu ? 10 : 300)
                .opacity(self.showMenu ? 1 : 0)
                .scaleEffect(self.showMenu ? 1: 0.1, anchor: .bottom)
                .animation(Animation.easeInOut(duration: 0.3))
            }
        }
    }
}

struct BottomMenuView_Previews: PreviewProvider {
    static var previews: some View {
        BottomMenuView()
    }
}
