//
//  MovingOffsetChallengeView.swift
//  SwiftUIBasics
//
//  Created by Song on 29/07/20.
//  Copyright © 2020 Adriano Song. All rights reserved.
//

import SwiftUI

struct MovingOffsetChallengeView: View {

    @State private var change = false

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Challenge").font(.largeTitle)
                Text("Move the Circle Shape")
                    .font(.body)
                    .foregroundColor(.gray)
                HStack {
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .padding()
                        .offset(
                            x: self.change ? geometry.size.width - 74 : 0,
                            y: self.change ? geometry.size.height - 200 : 0)
                        .animation(.easeInOut)

                    Spacer()
                }
                Spacer()
                Button(action: {
                    self.change.toggle()
                }, label: {
                    Text("Change")
                }).padding()
            }
        }
    }
}

struct MovingOffsetChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           MovingOffsetChallengeView()
              .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
              .previewDisplayName("iPhone SE")

            MovingOffsetChallengeView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")

           MovingOffsetChallengeView()
              .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
              .previewDisplayName("iPhone 11 Pro Max")
        }
    }
}
