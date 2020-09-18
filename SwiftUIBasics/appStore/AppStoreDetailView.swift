//
//  AppStoreDetailView.swift
//  SwiftUIBasics
//
//  Created by Song on 19/08/20.
//  Copyright © 2020 Adriano Song. All rights reserved.
//

import SwiftUI

struct AppStoreDetailView: View {

    var card: AppStoreCardModel

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                HStack {
                    Text(card.appCategory)
                        .foregroundColor(.gray)
                        .font(.system(size: 20, weight: .semibold))
                    Spacer()
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.gray)
                        .onTapGesture {
//                            self.expanded.toggle()
                        }
                }.padding(.horizontal, 16)
                    .padding(.top, 8)
                HStack {
                    Text(card.appName)
                        .foregroundColor(.white)
                        .font(.system(size: 32, weight: .semibold))
                    Spacer()
                }.padding(.horizontal, 16)

                Image(card.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding(.all, 16)

                VStack {
                    Text("Loren Ipsum")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white) +
                        Text(" dolor sit amet, consectetur adipiscing elit. Mauris urna eros, vulputate in dictum ac, viverra quis leo. Aenean suscipit, elit eu ultrices euismod, massa libero semper ex, vel venenatis ligula quam eget odio. Mauris non nisl dolor. Aliquam semper, dolor id lacinia lacinia, purus massa semper nibh, eget imperdiet sapien odio et lectus. Proin efficitur venenatis facilisis. Aliquam et volutpat quam. Praesent sit amet sem tristique, convallis felis vitae, tristique dolor. Sed facilisis blandit lobortis. Suspendisse at ex vel odio dignissim rutrum. Duis molestie fringilla pretium.")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.gray)
                }.padding(.horizontal, 16)
            }
        }//.edgesIgnoringSafeArea(.all)
        .background(Color.black)
    }
}

struct AppStoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppStoreDetailView(
            card: AppStoreCardModel(id: 0, appName: "Presentation App", appCategory: "OUR FAVORITIES", imageName: "speachImage"))
    }
}

struct AppStoreCardModel: Identifiable {
    var id: Int
    var appName: String = ""
    var appCategory: String = ""
    var imageName: String = ""
    var subTitle: String = ""
    var mainTitle: String = ""
    var description: String = ""
    var expanded: Bool = false
}
