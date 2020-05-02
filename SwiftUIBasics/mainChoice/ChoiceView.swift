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
            return AnyView(Text("todo"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceView().previewLayout(.device)
    }
}
