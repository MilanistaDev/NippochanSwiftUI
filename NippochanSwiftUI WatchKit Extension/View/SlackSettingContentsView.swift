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
    @Binding var text: String
    var type: SettingType
    @State var isPresented = false  // for help button

    var body: some View {
        Group {
            HStack {
                Text(title)
                    .font(.subheadline)
                    .padding(Edge.Set.top, 2.0)
                Button(action: {
                    self.isPresented.toggle()
                }) {
                    Image(systemName: "questionmark.circle.fill")
                }
                .frame(width: 20.0, height: 20.0)
                .cornerRadius(10.0)
                .sheet(isPresented: $isPresented, content: {
                    ScrollView {
                        Text(self.showDescription(type: self.type))
                            .foregroundColor(self.textColor(type: self.type))
                    }
                })
            }
            TextField(placeHolder, text: $text)
        }
    }

    private func showDescription(type: SettingType) -> String {
        switch type {
        case .webhook:
            return "※ Required\n\nEnter the URL of the Slack channel webhook you want to post.\n\nex) https: //hooks.slack ..."
        case .github:
            return "※ Required\n\nEnter the GitHub's account. This info replaces your profile in Slack."
        case .userName:
            return "※ Optional\n\nEnter your name. Your name will be the name of the Slack contributor. If not entered, the GitHub account name will be used."
        case .favColor:
            return "※ Optional\n\nEnter the color code in Hex format. This color is used as a modified color for Slack. # is unnecessary. \n\nex) 009944"
        }
    }

    private func textColor(type: SettingType) -> Color {
        switch type {
        case .webhook, .github: return .yellow
        case .userName, .favColor: return .gray
        }
    }
}
