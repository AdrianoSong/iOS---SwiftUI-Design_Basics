//
//  AppStoreTodayItem.swift
//  SwiftUIBasics
//
//  Created by Song on 18/08/20.
//  Copyright © 2020 Adriano Song. All rights reserved.
//

import SwiftUI

struct AppStoreTodayCellType1: View {

    @Binding var card: AppStoreCardModel
    @Binding var hero: Bool

    var body: some View {
        ZStack {
            if self.card.expanded {
                AppStoreDetailView(card: card)
            } else {
                Image(card.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding(.horizontal, 16)
                VStack {
                    HStack {
                        Text(card.subTitle)
                            .font(.headline)
                            .foregroundColor(.gray)
                            .padding(.leading, 38)
                            .padding(.top, 16)
                        Spacer()
                    }
                    HStack {
                        Text(card.mainTitle)
                            .font(.system(size: 32, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.leading, 38)
                            .padding(.top, 4)
                        Spacer()
                    }
                    Spacer()

                    HStack {
                        Text(card.description)
                            .font(.body)
                            .foregroundColor(.white)
                            .padding(.leading, 38)
                            .padding(.bottom, 4)
                        Spacer()
                    }
                }
            }
        }.frame( maxWidth: .infinity, maxHeight: 300)
    }
}

struct AppStoreTodayCellType1_Previews: PreviewProvider {
    static var previews: some View {
        AppStoreTodayCellType1(
            card: .constant(AppStoreCardModel(
                id: 0, imageName: "speachImage", subTitle: "OUR FAVORITES", mainTitle: "Polish your presentation", description: "These apps will help you create visually stunning slides")), hero: .constant(false))
    }
}
