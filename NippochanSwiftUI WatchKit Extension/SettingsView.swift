//
//  SettingsView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/07/20.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct SettingsView: View {

    let cellName = ["Add Activity", "Slack Settings", "App Version"]

    var body: some View {
        List(0..<self.cellName.count) { number in
            if (number == 0) {
                NavigationLink(destination: SendActivityView()) {
                    Text(self.cellName[number])
                    .font(.subheadline)
                }
            } else if (number == 1) {
                NavigationLink(destination: SendActivityView()) {
                    Text(self.cellName[number])
                    .font(.subheadline)
                }
            } else {
                NavigationLink(destination: AppInfoView()) {
                    Text(self.cellName[number])
                    .font(.subheadline)
                }
            }
        }
        .navigationBarTitle(Text("Settings"))
    }
}

#if DEBUG
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
#endif
