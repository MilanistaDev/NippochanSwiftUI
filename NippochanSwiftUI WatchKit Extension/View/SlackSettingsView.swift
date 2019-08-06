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

#if DEBUG
struct SlackSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SlackSettingsView()
    }
}
#endif
