//
//  ChoiceCell.swift
//  SwiftUIBasics
//
//  Created by Song on 30/04/20.
//  Copyright © 2020 Adriano Song. All rights reserved.
//

import Foundation
import SwiftUI

struct ChoiceCell: View {

    let choice: MainChoice

    var body: some View {

        HStack {
            Text(choice.rawValue)
                .font(Font.title)
                .padding(.leading, 16)
            Spacer()
        }
    }
}

struct ChoiceCell_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceCell(choice: .button).previewLayout(.device)
    }
}
