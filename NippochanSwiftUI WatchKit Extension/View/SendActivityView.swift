//
//  SendActivityView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/07/20.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct SendActivityView: View {

    let udConfig: UDConfig = UDConfig()
    @State var activityData: [ActivityModel] = []
    @State var isPresented = false

    var body: some View {
        List {
            ForEach(self.activityData){ activity in
                if activity.name == "Settings" {
                    NavigationLink(destination: SettingsView()) {
                        ActivityCarouselView(activity: activity)
                    }
                } else {
                    Button(action: {
                        self.isPresented = true
                        // TODO: Post Activity to Slack
                        // Use @Published isPresented, message
                    }) {
                        ActivityCarouselView(activity: activity)
                    }
                }
            }
            .onDelete { index in
                // Delete activity with the exception of Settings.
                if self.activityData[index.first!].deletable {
                    self.activityData.remove(at: index.first!)
                    self.udConfig.save(activities: self.activityData)
                }
            }
        }.alert(isPresented: $isPresented) { () -> Alert in
            Alert(title: Text("Post Completed!!"))
        }
        .listStyle(CarouselListStyle())
        .navigationBarTitle(Text("Activity"))
        .onAppear {
            self.activityData = self.udConfig.loadActivityList()
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
