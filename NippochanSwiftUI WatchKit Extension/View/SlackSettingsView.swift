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

    private enum FieldType: Int {
        case a
        case b
        case c
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text("Webhook URL")
                        .font(.subheadline)
                        .padding(Edge.Set.top, 2.0)
                    Button(action: {
                        print("Show Description for Slack Webhook.")
                    }) {
                        Image("ic_help")
                    }
                    .frame(width: 20.0, height: 20.0)
                    .cornerRadius(10.0)
                }
                TextField("https://hooks.slack...", text: $webHookUrl)

                HStack {
                    Text("GitHub URL")
                        .font(.subheadline)
                        .padding(Edge.Set.top, 2.0)
                    Button(action: {
                        print("Show Description for GitHub Link and explain how to be used.")
                    }) {
                        Image("ic_help")
                    }
                    .frame(width: 20.0, height: 20.0)
                    .cornerRadius(10.0)
                }
                TextField("https://github...", text: $gitHubLink)

                HStack {
                    Text("Favorite Color")
                        .font(.subheadline)
                        .padding(Edge.Set.top, 2.0)
                    Button(action: {
                        print("Show Description for favorite Color.")
                    }) {
                        Image("ic_help")
                    }
                    .frame(width: 20.0, height: 20.0)
                    .cornerRadius(10.0)
                }
                TextField("#009944", text: $favoriteColorHex)
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
