//
//  SlackSettingsView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/07/20.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

enum SettingType {
    case webhook
    case github
    case favColor
}

struct SlackSettingsView: View {

    @State private var webHookUrl: String = ""
    @State private var gitHubLink: String = ""
    @State private var favoriteColorHex: String = ""

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                SlackSettingContentsView(title: "Webhook URL",
                                         placeHolder: "https://hooks.slack...",
                                         text: $webHookUrl,
                                         type: .webhook)
                SlackSettingContentsView(title: "GitHub URL",
                                         placeHolder: "https://github.com/MilanistaDev",
                                         text: $gitHubLink,
                                         type: .github)
                SlackSettingContentsView(title: "Favorite Color",
                                         placeHolder: "#009944",
                                         text: $favoriteColorHex,
                                         type: .favColor)
            }
            .navigationBarTitle(Text("Slack Settings"))
        }
    }
}

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

#if DEBUG
struct SlackSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SlackSettingsView()
    }
}
#endif
