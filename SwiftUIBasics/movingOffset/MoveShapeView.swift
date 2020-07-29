//
//  MoveShapeView.swift
//  AnimationExercises
//
//  Created by Song on 23/07/20.
//  Copyright © 2020 Song. All rights reserved.
//

import SwiftUI

struct MoveShapeView: View {

    @State private var change: Bool = true
    private var offSetValue: CGFloat = 200

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            //Logo here
            VStack(spacing: 1) {
                HStack(alignment: .bottom, spacing: 1) {
                    Rectangle()
                        .frame(width: 70, height: 35)
                        .offset(x: change ? 0 : -offSetValue)
                    Rectangle()
                        .frame(width: 35, height: 70)
                        .offset(y: change ? 0 : -offSetValue)
                }.offset(x: -18)
                HStack(alignment: .top, spacing: 1) {
                    Rectangle()
                        .frame(width: 36, height: 72)
                        .offset(y: change ? 0 : offSetValue)
                    Rectangle()
                        .frame(width: 72, height: 36)
                        .offset(x: change ? 0 : offSetValue)
                }.offset(x: 18)
            }.rotationEffect(.degrees(change ? 0 : -90))
                .foregroundColor(change ? .red : .orange)
                .opacity(change ? 1 : 0)
                .animation(.default)

            Spacer()

            Button(action: {
                self.change.toggle()
            }, label: {
                Text("Change")
            }).padding(.bottom)
        }
    }
}

struct MoveShapeWithOffset_Previews: PreviewProvider {
    static var previews: some View {
        MoveShapeView()
    }
}
