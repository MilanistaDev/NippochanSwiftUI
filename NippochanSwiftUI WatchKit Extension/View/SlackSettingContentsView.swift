//
//  SlackSettingContentsView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/08/07.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct SlackSettingContentsView: View {

    var title: String
    var placeHolder: String
    var text: Binding<String>
    var type: SettingType
    @State var isPresented = false

    var body: some View {
        Group {
            HStack {
                Text(title)
                    .font(.subheadline)
                    .padding(Edge.Set.top, 2.0)
                Button(action: {
                    self.isPresented.toggle()
                }) {
                    Image("ic_help")
                }
                .frame(width: 20.0, height: 20.0)
                .cornerRadius(10.0)
                .sheet(isPresented: $isPresented, content: {
                    Text(self.showDescription(type: self.type))
                })
            }
            TextField(placeHolder, text: text)
        }
    }

    private func showDescription(type: SettingType) -> String {
        switch type {
        case .webhook:
            return "Description for webhook"
        case .github:
            return "Description for GitHub"
        case .favColor:
            return "Description for Favorite Color"
        }
    }
}
