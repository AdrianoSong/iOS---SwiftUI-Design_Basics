//
//  AppStoreView.swift
//  SwiftUIBasics
//
//  Created by Song on 18/08/20.
//  Copyright © 2020 Adriano Song. All rights reserved.
//

import SwiftUI

struct AppStoreView: View {
    var body: some View {
        TabView {
            TodayView().tabItem {
                Image(systemName: "doc.richtext")
                Text("Today")
            }

            GamesView().tabItem {
                Image(systemName: "gamecontroller.fill")
                Text("Games")
            }

            AppsView().tabItem {
                Image(systemName: "line.horizontal.3")
                Text("Apps")
            }

            ArcadeView().tabItem {
                Image(systemName: "desktopcomputer")
                Text("Arcade")
            }

            SearchView().tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
        }.preferredColorScheme(.dark)
    }
}

struct AppStoreView_Previews: PreviewProvider {
    static var previews: some View {
        AppStoreView()
    }
}

struct TodayView: View {

    @State private var changeScale = false
    @State private var hero = false

    @State private var data = [
        AppStoreCardModel(
            id: 0, imageName: "speachImage", subTitle: "OUR FAVORITES", mainTitle: "Polish your presentation", description: "These apps will help you create visually stunning slides"),
        AppStoreCardModel(
            id: 1, imageName: "speachImage", subTitle: "OUR FAVORITES", mainTitle: "Polish your presentation", description: "These apps will help you create visually stunning slides"),
        AppStoreCardModel(
            id: 2, imageName: "speachImage", subTitle: "OUR FAVORITES", mainTitle: "Polish your presentation", description: "These apps will help you create visually stunning slides"),
        AppStoreCardModel(
            id: 3, imageName: "speachImage", subTitle: "OUR FAVORITES", mainTitle: "Polish your presentation", description: "These apps will help you create visually stunning slides"),
        AppStoreCardModel(
            id: 4, imageName: "speachImage", subTitle: "OUR FAVORITES", mainTitle: "Polish your presentation", description: "These apps will help you create visually stunning slides")
    ]

    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                AppStoreHeaderView(hasDate: true, tabName: "Today").opacity(self.hero ? 0 : 1)
                VStack(spacing: 8) {
                    ForEach(0..<self.data.count) { index in
                        GeometryReader { gr in
                            AppStoreTodayCellType1(card: self.$data[index], hero: self.$hero)
                                //here is the main animation
                                .offset(y: self.data[index].expanded ? -gr.frame(in: .global).minY : 0)
                                //hidde all other views
                                .opacity(self.hero ? (self.data[index].expanded ? 1 : 0) : 1)
                                .onTapGesture {
                                    withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.2)) {
                                        self.hero.toggle()
                                        self.data[index].expanded.toggle()
                                    }
                                }
                        }
                        .frame(height: self.data[index].expanded ? UIScreen.main.bounds.height : 320)

                        //here to disable scrolling when expanded item view
                        .simultaneousGesture(DragGesture(minimumDistance: self.data[index].expanded ? 0 : 500).onChanged{_ in print("dragging")})
                    }
                }
                Button(action: {}, label: {
                    Text("Redeem")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .semibold))
                        .padding(.all, 8)
                }).frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 8).fill(Color.gray.opacity(0.2)))
                    .padding()
                    .opacity(self.hero ? 0 : 1)

                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .padding(.horizontal, 16)
                    .opacity(self.hero ? 0 : 1)

                HStack {
                    Text("Terms & Conditions")
                        .foregroundColor(Color.gray)
                    Image(systemName: "chevron.right")
                        .font(.system(size: 12))
                        .foregroundColor(Color.gray)
                    Spacer()
                }.padding()
                    .opacity(self.hero ? 0 : 1)
            }
        }
    }
}

struct GamesView: View {
    var body: some View {
        ScrollView {
            VStack {
                AppStoreHeaderView(hasDate: false, tabName: "Games")
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct AppsView: View {
    var body: some View {
        ScrollView {
            VStack {
                AppStoreHeaderView(hasDate: false, tabName: "Apps")
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ArcadeView: View {
    var body: some View {
        ScrollView {
            VStack {
                AppStoreHeaderView(hasDate: false, tabName: "Arcade")
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct SearchView: View {
    var body: some View {
        ScrollView {
            VStack {
                AppStoreHeaderView(hasDate: false, tabName: "Search")
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
