//
//  FloatingButtons.swift
//  AnimationExercises
//
//  Created by Song on 23/07/20.
//  Copyright © 2020 Song. All rights reserved.
//

import SwiftUI

struct FloatingButtons: View {

    @State private var showButtons = false

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Group {
                Button(action: {
                    self.showButtons.toggle()
                }, label: {
                    Image(systemName: "bag.badge.plus")
                        .padding(24)
                        .rotationEffect(.degrees(showButtons ? 0 : -90))
                }
                ).background(
                    Circle()
                        .fill(Color.green)
                        .shadow(radius: 8, x: 4, y: 4)
                ).offset(x: 0, y: showButtons ? -150: 0)
                    .opacity(showButtons ? 1 : 0)

                Button(action: {
                    self.showButtons.toggle()
                }, label: {
                    Image(systemName: "gauge.badge.plus")
                        .padding(24)
                        .rotationEffect(.degrees(showButtons ? 0 : 90))
                }).background(Circle()
                    .fill(Color.green)
                    .shadow(radius: 8, x: 4, y: 4))
                    .offset(x: showButtons ? -100 : 0, y: showButtons ? -110 : 0)
                    .opacity(showButtons ? 1 : 0)

                Button(action: {
                    self.showButtons.toggle()
                }, label: {
                    Image(systemName: "calendar.badge.plus")
                        .padding(24)
                        .rotationEffect(.degrees(showButtons ? 0 : 90))
                }).background(Circle()
                    .fill(Color.green)
                    .shadow(radius: 8, x: 4, y: 4))
                    .offset(x: showButtons ? -150 : 0, y: 0)
                    .opacity(showButtons ? 1 : 0)

                Button(action: {
                    self.showButtons.toggle()
                }, label: {
                    Image(systemName: "plus")
                    .padding(24)
                        .rotationEffect(.degrees(showButtons ? 45 : 0))
                }).background(Circle()
                    .fill(Color.green)
                    .shadow(radius: 8, x: 4, y: 4))
            }.padding(.trailing, 20)
                .accentColor(.white)
                .animation(.default)
        }
    }
}

struct FloatingButtons_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButtons()
    }
}
