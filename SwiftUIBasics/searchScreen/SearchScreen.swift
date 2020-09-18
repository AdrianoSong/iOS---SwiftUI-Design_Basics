//
//  SearchView.swift
//  SwiftUIBasics
//
//  Created by Song on 17/09/20.
//  Copyright © 2020 Adriano Song. All rights reserved.
//

import SwiftUI

// extension for keyboard to dismiss
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

@available(iOS 14.0, *)
struct SearchScreen: View {

    @State private var searchNumber = ""
    @State private var isSearching = false

    var body: some View {

        NavigationView {
            ScrollView {

                CustomSearchField(searchNumber: $searchNumber, isSearching: $isSearching)

                ForEach((0..<100).filter({ "\($0)".contains(searchNumber) || searchNumber.isEmpty}), id: \.self) { num in
                    LazyHStack {
                        Text("\(num)")
                        Spacer()
                    }.padding(.all, 8)

                    Divider()
                }
            }
            .navigationTitle("Search number")
        }
    }
}

struct CustomSearchField: View {

    @Binding var searchNumber: String
    @Binding var isSearching: Bool

    var body: some View {
        HStack {
            HStack {
                TextField("Search numbers here", text: $searchNumber)
                    .keyboardType(.numberPad)
                    .padding(.leading, 24)
            }
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(6)
            .padding(.horizontal)
            .onTapGesture(perform: {
                isSearching = true
            })
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    if isSearching {
                        Button(action: {
                            searchNumber = ""
                            isSearching = false
                            UIApplication.shared.endEditing()
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                        }).disabled(!isSearching)
                    }
                }
                .foregroundColor(.gray)
                .padding(.horizontal, 32)
            ).transition(.move(edge: .trailing))
            .animation(.easeOut)

            if isSearching {
                Button(action: {
                    searchNumber = ""
                    isSearching = false
                    UIApplication.shared.endEditing()
                }, label: {
                    Text("Cancel")
                })
                .padding(.trailing)
                .padding(.leading, -12)
                .transition(.move(edge: .trailing))
                .animation(.easeOut)
            }
        }
    }
}

@available(iOS 14.0, *)
struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
