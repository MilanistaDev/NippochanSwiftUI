//
//  SlackSettingsView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/07/20.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct SlackSettingsView: View {

    @State private var webHookUrl: String = ""
    @State private var gitHubLink: String = ""
    @State private var favoriteColorHex: String = ""

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                LabelTextField(title: "Webhook URL",
                               placeHolder: "https://hooks.slack...",
                               text: $webHookUrl)
                LabelTextField(title: "GitHub URL",
                               placeHolder: "https://github.com/MilanistaDev",
                               text: $gitHubLink)
                LabelTextField(title: "Favorite Color",
                               placeHolder: "#009944",
                               text: $favoriteColorHex)
            }
            .navigationBarTitle(Text("Slack Settings"))
        }
    }
}

struct LabelTextField: View {

    var title: String
    var placeHolder: String
    var text: Binding<String>

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.subheadline)
                    .padding(Edge.Set.top, 2.0)
                Button(action: {
                }) {
                    Image("ic_help")
                }
                .frame(width: 20.0, height: 20.0)
                .cornerRadius(10.0)
            }
            TextField(placeHolder, text: text)
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
