//
//  CardsCollection.swift
//  SwiftUIBasics
//
//  Created by Song on 11/05/20.
//  Copyright © 2020 Adriano Song. All rights reserved.
//

import SwiftUI

struct CardsCollection: View {

    @State private var dragAmount = CGSize.zero
    @State private var enable = false
    @State private var letterDragAmount = CGSize.zero

    let letters = Array("Hello SwiftUI")

    var body: some View {
        VStack {
            /// letters
            HStack(spacing: 0) {
                ForEach(0..<letters.count) { number in
                    Text(String(self.letters[number]))
                        .font(.title)
                        .background(self.enable ? Color.blue : Color.red)
                        .offset(self.letterDragAmount)
                        //snake animation effect
                        .animation(Animation.default.delay(Double(number) / 20))
                }
            }.padding([.leading, .trailing], 16)
                .gesture(
                    DragGesture()
                        .onChanged {self.letterDragAmount = $0.translation}
                        .onEnded { _ in
                            self.letterDragAmount = .zero
                            self.enable.toggle()
                    }
                )

            ///cards
            ZStack {
                CardView(cardTitle: "Card 1", cardColor: Color(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)))
                    .shadow(radius: 10)

                CardView(cardTitle: "Card 2")
                    .padding(.top, 48)
                    .shadow(radius: 10)

                //Drag gesture animate only this card
                CardView(cardTitle: "Card 3", cardColor: Color(#colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)))
                    .padding(.top, 90)
                    .shadow(radius: 10)
                    .animation(.spring())
                    .offset(dragAmount)
                    .gesture(
                        DragGesture()
                            .onChanged { self.dragAmount = $0.translation }
                            .onEnded  { _ in self.dragAmount = .zero }
                    )
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CardsCollection_Previews: PreviewProvider {
    static var previews: some View {
        CardsCollection()
    }
}
