//
//  ChoiceViewModel.swift
//  SwiftUIBasics
//
//  Created by Song on 30/04/20.
//  Copyright © 2020 Adriano Song. All rights reserved.
//

import Foundation

enum MainChoice: String, CaseIterable {

    case appStore = "App Store"
    case button = "Neumorphic Buttons"
    case card = "Gestures, blend and transform"
    case slideMenu = "Left side in menu"
    case animationTransition = "Animate transition with blur"
    case contextMenu = "Context menu"
    case movingOffset = "View Animate offset"
    case movingOffsetChallenge = "View Animate offset challenge"
    case floatingButtons = "Floating buttons"
    case popupView = "Popup view"
    case bottomMenu = "Bottom menu"
    case loginView = "Simple Login Screen"
    case detailView = "Simple detail zoom view"
    case menuHelper = "Menu helper"
    case searchScreen = "Search View"
}

///The only way to add Identifiable to an Enum type
extension MainChoice: Identifiable {
    var id: MainChoice { self }
}

class ChoiceViewModel {

    let choiceArray: [MainChoice]

    init() {
        choiceArray = [
            .appStore,
            .button,
            .card,
            .slideMenu,
            .animationTransition,
            .contextMenu,
            .movingOffset,
            .movingOffsetChallenge,
            .floatingButtons,
            .popupView,
            .bottomMenu,
            .loginView,
            .detailView,
            .menuHelper,
            .searchScreen
        ]
    }
}
