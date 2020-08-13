//
//  MenuHelperView.swift
//  SwiftUIBasics
//
//  Created by Song on 13/08/20.
//  Copyright © 2020 Adriano Song. All rights reserved.
//

import SwiftUI

struct MenuHelperView: View {

    @State private var expandMoreInfo = false
    @State private var showInfo = false

    var body: some View {
        VStack {

            Spacer()

            GeometryReader { gr in
                VStack {
                    HStack {
                        Image(systemName: "info.circle").padding(.horizontal)
                        Text("Login help")
                        Spacer()
                    }.padding(.top)
                    VStack {
                        Image(systemName: "slider.horizontal.3")
                            .font(.largeTitle)
                        Text("Appear after animation finish")
                        Spacer()
                    }.frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15)
                        .opacity(0.1))
                    .padding(.horizontal)
                    .opacity(self.showInfo ? 1 : 0)
                }.padding(.trailing, 12)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.yellow).shadow(radius: 8))
                .foregroundColor(.black)
                .offset(x: self.expandMoreInfo ? 15 : (gr.frame(in: .global).width - 65),
                        y: self.expandMoreInfo ? 15 : (gr.frame(in: .global).height - 65))
                    .onTapGesture {
                        withAnimation {
                            self.expandMoreInfo.toggle()
                        }
                        withAnimation(Animation.default.delay(0.5)) {
                            self.showInfo.toggle()
                        }
                }
            }
        }.edgesIgnoringSafeArea(.bottom)
            .font(.title)
    }
}

struct MenuHelperView_Previews: PreviewProvider {
    static var previews: some View {
        MenuHelperView()
    }
}
