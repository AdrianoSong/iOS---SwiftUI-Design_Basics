//
//  SimpleLoginView.swift
//  SwiftUIBasics
//
//  Created by Song on 29/07/20.
//  Copyright © 2020 Adriano Song. All rights reserved.
//

import SwiftUI

struct SimpleLoginView: View {

    @State private var showLogin = false
    @State private var userName = ""
    @State private var password = ""

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 8) {
                Text("Challenge").font(.largeTitle)

                Text("Show login").font(.body).foregroundColor(.gray)

                Spacer()

                Text("Already have an account?").font(.title)

                Button(action: {
                    withAnimation(.easeInOut) {
                        self.showLogin.toggle()
                    }
                }, label: {
                    Text("Login now")
                })

                Image(systemName: "lock.shield")
                    .font(.system(size: 35))
                    .offset(x: self.showLogin ? 0 : -geometry.size.width)
                    .padding()

                TextField("Username", text: self.$userName)
                    .font(.system(size: 24))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .offset(x: self.showLogin ? 0 : -geometry.size.width)
                    .padding([.leading, .trailing], 16)

                TextField("Password", text: self.$password)
                    .font(.system(size: 24))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .offset(x: self.showLogin ? 0 : -geometry.size.width)
                    .padding([.leading, .trailing], 16)

                Spacer()

                Spacer()
            }
        }
    }
}

struct SimpleLoginView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleLoginView()
    }
}
