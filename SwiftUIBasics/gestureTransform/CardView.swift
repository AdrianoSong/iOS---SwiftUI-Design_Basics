//
//  CardView.swift
//  SwiftUIBasics
//
//  Created by Song on 11/05/20.
//  Copyright © 2020 Adriano Song. All rights reserved.
//

import SwiftUI

struct CardView: View {

    var cardTitle = "Card"
    var cardColor: Color = Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))

    var body: some View {
        Text(cardTitle)
            .foregroundColor(.white)
            .font(.system(size: 32, weight: .semibold))
            .frame(width: UIScreen.main.bounds.width - 40, height: 200)
            .background(cardColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
