//
//  SendActivityView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/07/20.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct SendActivityView: View {

    @State var activityData: [ActivityModel] = [
        ActivityModel(name: "出社", emoji: "🏢", deletable: true),
        ActivityModel(name: "作業開始", emoji: "👨‍💻", deletable: true),
        ActivityModel(name: "お昼休憩", emoji: "🍖", deletable: true),
        ActivityModel(name: "作業再開", emoji: "👩‍💻", deletable: true),
        ActivityModel(name: "離席", emoji: "☕️", deletable: true),
        ActivityModel(name: "作業終了", emoji: "🍻", deletable: true),
        ActivityModel(name: "早退", emoji: "🕞", deletable: true),
        ActivityModel(name: "Settings", emoji: "✍️", deletable: false)
    ]

    var body: some View {
        List {
            ForEach(self.activityData){ activity in
                if activity.name == "Settings" {
                    NavigationLink(destination: SettingsView()) {
                        ActivityCarouselView(activity: activity)
                    }
                } else {
                    NavigationLink(destination: SlackSettingsView()) {
                        ActivityCarouselView(activity: activity)
                    }
                }
            }
            .onDelete { index in
                self.activityData.remove(at: index.first!)
            }
        }
        .listStyle(CarouselListStyle())
        .navigationBarTitle(Text("Activity"))
    }
}

#if DEBUG
struct SendActivityView_Previews: PreviewProvider {
    static var previews: some View {
        SendActivityView()
    }
}
#endif
