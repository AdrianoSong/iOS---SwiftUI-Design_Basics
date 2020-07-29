//
//  PopupView.swift
//  AnimationExercises
//
//  Created by Song on 25/07/20.
//  Copyright © 2020 Song. All rights reserved.
//

import SwiftUI

struct PopupView: View {

    @State private var showPopup = false
    @GestureState private var popupOffset = CGSize.zero

    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    self.showPopup.toggle()
                }, label: {
                    Text("Show popup").font(.title)
                })

                Spacer()
            }.blur(radius: showPopup ? 2 : 0)
            .animation(.easeOut)

            if showPopup {
                //popup elements
                ZStack {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            self.showPopup = false
                    }

                    VStack(spacing: 8) {
                        Text("My Custom Popup title")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .font(.title)
                            .background(Color.yellow)
                        Spacer()
                        Text("My custom Popup description")
                        Spacer()
                        Button(action: {
                            self.showPopup.toggle()
                        }, label: {
                            Text("Close popup")
                        }).padding(.top)
                    }.frame(height: 300)
                    .background(Color.white)
                    .cornerRadius(25)
                    .shadow(radius: 20)
                    .padding()
                    .offset(popupOffset)
                    .gesture(DragGesture(minimumDistance: 100)
                        .updating($popupOffset, body: { (value, popupOffset, _) in

                            popupOffset = value.translation
                        })
                        .onEnded({ _ in
                            self.showPopup = false
                        })
                    )
                }.animation(.default)
            }
        }.animation(.easeIn)
    }
}

struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView()
    }
}
