//
//  ContentView.swift
//  SwiftUIBasics
//
//  Created by Song on 30/04/20.
//  Copyright © 2020 Adriano Song. All rights reserved.
//

import SwiftUI

struct ChoiceView: View {

    let viewModel: ChoiceViewModel

    init() {
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none

        viewModel = ChoiceViewModel()
    }

    var body: some View {
        NavigationView {
            List(viewModel.choiceArray, id: \.self) { choice in
                NavigationLink(destination: self.whereToGo(choice: choice)) {
                    ChoiceCell(choice: choice)
                }
            }
            .navigationBarTitle(Text("SwiftUI Basics"))
        }
    }

    /// this function is prepared for more enum options
    func whereToGo(choice: MainChoice) -> some View {
        switch choice {
        case .button:
            return AnyView(NeumorphicButtons())
        case .card:
            return AnyView(CardsCollection())
        case .slideMenu:
            return AnyView(SlideMenuView())
        case .animationTransition:
            return AnyView(TransitionWithBlur())
        case .contextMenu:
            return AnyView(ContextMenuView())
        case .movingOffset:
            return AnyView(MoveShapeView())
        case .movingOffsetChallenge:
            return AnyView(MovingOffsetChallengeView())
        case .floatingButtons:
            return AnyView(FloatingButtons())
        case .popupView:
            return AnyView(PopupView())
        case .bottomMenu:
            return AnyView(BottomMenuView())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceView().previewLayout(.device)
    }
}
