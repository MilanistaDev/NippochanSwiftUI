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
     @Environment(\.presentationMode) var presentationMode

    let udConfig = UDConfig()
    @State private var webHookUrl: String = UDConfig().getSettingsData(type: .webhook)
    @State private var gitHubLink: String = UDConfig().getSettingsData(type: .github)
    @State private var favoriteColorHex: String = UDConfig().getSettingsData(type: .favColor)
    @State private var isPresented = false

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
                Button(action: {
                    self.isPresented.toggle()
                    self.udConfig.save(slackWebhookUrl: self.webHookUrl,
                                       gitHubUrl: self.gitHubLink,
                                       favoriteColor: self.favoriteColorHex)
                }) {
                    Text("SAVE")
                        .font(.headline)
                    }.alert(isPresented: $isPresented, content: {
                        Alert(title: Text("Success"),
                              message: Text("The input data has been stored."),
                              dismissButton: Alert.Button.default(Text("OK"),
                                                                  action: {
                                                                    self.presentationMode.wrappedValue.dismiss()
                              }))
                    })

                .background(Color.green)
                .cornerRadius(10.0)
            }
        }.navigationBarTitle(Text("Slack Settings"))
    }
}

#if DEBUG
struct SlackSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SlackSettingsView()
    }
}
#endif
