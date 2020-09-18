//
//  AppStoreHeaderView.swift
//  SwiftUIBasics
//
//  Created by Song on 18/08/20.
//  Copyright © 2020 Adriano Song. All rights reserved.
//

import SwiftUI

struct AppStoreHeaderView: View {

    var hasDate: Bool
    var tabName: String

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(hasDate ? "MONDAY 10 AUGUST" : " ")
                    .foregroundColor(.gray)
                    .font(.system(size: 20, weight: .semibold))
                Spacer()
            }.padding(.horizontal, 16)
            HStack {
                Text(tabName)
                    .foregroundColor(.white)
                    .font(.system(size: 38, weight: .semibold))
                Spacer()
                Image("owl").resizable().frame(width: 50, height: 50).cornerRadius(30)
            }.padding(.horizontal, 16)
        }.background(Color.black)
    }
}

struct AppStoreHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AppStoreHeaderView(hasDate: true, tabName: "Today")
    }
}
