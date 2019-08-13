//
//  SendActivityView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/07/20.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct SendActivityView: View {

    @State var activityData: [ActivityModel] = UserDefaultsConfig.activityData

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
