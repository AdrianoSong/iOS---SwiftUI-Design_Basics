//
//  ContextMenu.swift
//  SwiftUIBasics
//
//  Created by Song on 25/05/20.
//  Copyright © 2020 Adriano Song. All rights reserved.
//

import SwiftUI

struct ContextMenuView: View {

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                CardView(cardTitle: "Card 1", cardColor: Color(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)))
                    .shadow(radius: 10)
                    .contextMenu {
                        myAppContextMenu(title: "Card 1")
                    }

                CardView(cardTitle: "Card 2")
                    .shadow(radius: 10)
                    .contextMenu {
                        myAppContextMenu()
                    }

                CardView(cardTitle: "Card 3", cardColor: Color(#colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)))
                    .shadow(radius: 10)
                    .contextMenu {
                        myAppContextMenu()
                    }
            }
        }
    }
}

struct ContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuView()
    }
}

extension View {

    func myAppContextMenu(title: String = "") -> some View {
        VStack {
            Button(action: {}, label: {
                HStack {
                    Text("Make First")
                    Image(systemName: "star")
                }
            })

            Button(action: {}, label: {
                HStack {
                    Text(title.isEmpty ? "Remove" : "Remove: \(title)")
                    Image(systemName: "trash")
                }
            })
        }
    }
}
