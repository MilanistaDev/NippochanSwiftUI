//
//  SettingsView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/07/20.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct SettingsView: View {

    @ObservedObject var activityVM: ActivityViewModel

    var body: some View {
        VStack {
            NavigationLink(destination: AddActivityView(activityVM: self.activityVM, activity: ActivityModel(name: "", emoji: "🆕", deletable: true))) {
                Text("Add Activity").font(.subheadline)
            }
            NavigationLink(destination: SlackSettingsView()) {
                Text("Slack Settings").font(.subheadline)
            }
            NavigationLink(destination: AppInfoView()) {
                Text("App Version").font(.subheadline)
            }
        }
        .navigationBarTitle(Text("Settings"))
    }
}

#if DEBUG
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(activityVM: ActivityViewModel())
    }
}
#endif
