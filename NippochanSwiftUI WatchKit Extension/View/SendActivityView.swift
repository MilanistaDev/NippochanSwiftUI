//
//  SendActivityView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/07/20.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct SendActivityView: View {

    @State var activityData: [ActivityModel] = []

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
                // Delete activity with the exception of Settings.
                if self.activityData[index.first!].deletable {
                    self.activityData.remove(at: index.first!)
                    save(activities: self.activityData)
                }
            }
        }
        .listStyle(CarouselListStyle())
        .navigationBarTitle(Text("Activity"))
        .onAppear {
            self.activityData = loadActivityList()
        }
    }
}

#if DEBUG
struct SendActivityView_Previews: PreviewProvider {
    static var previews: some View {
        SendActivityView()
    }
}
#endif
