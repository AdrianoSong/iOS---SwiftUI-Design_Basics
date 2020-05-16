//
//  TransitionWithBlur.swift
//  SwiftUIBasics
//
//  Created by Song on 16/05/20.
//  Copyright © 2020 Adriano Song. All rights reserved.
//

import SwiftUI

struct TransitionWithBlur: View {

    @State var show = false

    var body: some View {
        VStack {
            Text("Learning new tech")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding(5)

            Image("courses")
                .aspectRatio(contentMode: .fit)
                .frame(width: show ?
                        (UIScreen.main.bounds.width - 40) : 300,
                       height: show ?
                        (UIScreen.main.bounds.height - 270) : 300)
                .clipped()
                .cornerRadius(show ? 0 : 30)
                .shadow(radius: 30)
                .blur(radius: show ? 0 : 10)
                .animation(.spring())

            Text("A course focused on UI")
                .font(.subheadline)
                .fontWeight(.regular)
                .foregroundColor(.gray)
                .padding(4)

            Button(action: {
                withAnimation {
                    self.show.toggle()
                }
            }, label: {
                Text("Animate")
            })

            Spacer()
        }
    }
}

struct TransitionWithBlur_Previews: PreviewProvider {
    static var previews: some View {
        TransitionWithBlur()
    }
}
