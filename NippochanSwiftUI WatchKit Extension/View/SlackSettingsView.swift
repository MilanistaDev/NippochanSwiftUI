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
    case userName
    case favColor
}

// FIXME: There is no consistency with the input value.
// The data is not updated even if the input value is saved and the screen returns to the setting list screen and transitions to this screen again.
struct SlackSettingsView: View {

    let udConfig = UDConfig()
    @State private var webHookUrl: String = UDConfig().getSettingsData(type: .webhook)
    @State private var gitHubLink: String = UDConfig().getSettingsData(type: .github)
    @State private var userName: String = UDConfig().getSettingsData(type: .userName)
    @State private var favoriteColorHex: String = UDConfig().getSettingsData(type: .favColor)
    @State private var isPresented = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                SlackSettingContentsView(title: "Webhook URL*",
                                         placeHolder: "https://hooks.slack...",
                                         text: $webHookUrl,
                                         type: .webhook)
                SlackSettingContentsView(title: "GitHub's account*",
                                         placeHolder: "JohnnyDev",
                                         text: $gitHubLink,
                                         type: .github)
                SlackSettingContentsView(title: "Your Name",
                                         placeHolder: "John Smith",
                                         text: $userName,
                                         type: .userName)
                SlackSettingContentsView(title: "Favorite Color",
                                         placeHolder: "009944",
                                         text: $favoriteColorHex,
                                         type: .favColor)
                Button(action: {
                    // Save inputted data
                    self.saveData()
                }) {
                    Text("SAVE")
                        .font(.headline)
                }.alert(isPresented: $isPresented, content: {
                    Alert(title: Text("Success"),
                          message: Text("The input data has been stored."),
                          dismissButton: .default(Text("OK"))
                    )
                })
                .background(Color.green)
                .cornerRadius(10.0)
            }
        }.navigationBarTitle(Text("Slack Settings"))
    }

    /// Save inputted data to User Defaults
    private func saveData() {
        self.udConfig.save(slackWebhookUrl: self.webHookUrl,
                           gitHubUrl: self.gitHubLink,
                           userName: self.userName,
                           favoriteColor: self.favoriteColorHex)
        // After saving, show Alert.
        self.isPresented.toggle()
    }
}

#if DEBUG
struct SlackSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SlackSettingsView()
    }
}
#endif
