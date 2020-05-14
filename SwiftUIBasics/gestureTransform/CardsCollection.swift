//
//  CardsCollection.swift
//  SwiftUIBasics
//
//  Created by Song on 11/05/20.
//  Copyright © 2020 Adriano Song. All rights reserved.
//

import SwiftUI

struct CardsCollection: View {
    var body: some View {
        ZStack {
            CardView(cardTitle: "Card 1", cardColor: Color(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)))
                .shadow(radius: 10)
                .animation(.spring())

            CardView(cardTitle: "Card 2")
                .padding(.top, 48)
                .shadow(radius: 10)
                .animation(.spring())

            CardView(cardTitle: "Card 3", cardColor: Color(#colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)))
                .padding(.top, 90)
                .shadow(radius: 10)
                .animation(.spring())

        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CardsCollection_Previews: PreviewProvider {
    static var previews: some View {
        CardsCollection()
    }
}
