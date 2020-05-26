//
//  ChoiceViewModel.swift
//  SwiftUIBasics
//
//  Created by Song on 30/04/20.
//  Copyright © 2020 Adriano Song. All rights reserved.
//

import Foundation

enum MainChoice: String, CaseIterable {

    case button = "Neumorphic Buttons"
    case card = "Gestures, blend and transform"
    case slideMenu = "Left side in menu"
    case animationTransition = "Animate transition with blur"
    case contextMenu = "Context menu"
}

///The only way to add Identifiable to an Enum type
extension MainChoice: Identifiable {
    var id: MainChoice { self }
}

class ChoiceViewModel {

    let choiceArray: [MainChoice]

    init() {
        choiceArray = [.button, .card, .slideMenu, .animationTransition, .contextMenu]
    }
}
