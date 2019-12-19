//
//  SendActivityView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/07/20.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct SendActivityView: View {

    let udConfig = UDConfig()
    @State private var activityData: [ActivityModel] = []
    @ObservedObject var postActivity = PostActivity()

    var body: some View {
        List {
            ForEach(self.activityData){ activity in
                if activity.name == "Settings" {
                    NavigationLink(destination: SettingsView()) {
                        ActivityCarouselView(activity: activity)
                    }
                } else {
                    Button(action: {
                        // Post actiity to Slack
                        self.postActivity.post(activity: activity)
                    }) {
                        ActivityCarouselView(activity: activity)
                    }
                }
            }
            .onDelete { index in
                // Delete activity with the exception of Settings.
                self.deleteData(dataIndex: index)
            }
        }.alert(isPresented: $postActivity.isShowDialog) { () -> Alert in
            Alert(title: Text(postActivity.isSuccess ? "Success": "Failure"),
                  message: Text(postActivity.message),
                  dismissButton: .default(Text("OK")))
        }
        .listStyle(CarouselListStyle())
        .navigationBarTitle(Text("Activity List"))
        .onAppear {
            self.activityData = self.udConfig.loadActivityList()
        }
    }

    /// Delete activity data from Activity List
    /// - Parameter index: Index of the corresponding data of Activity List
    private func deleteData(dataIndex: IndexSet) {
        if self.activityData[dataIndex.first!].deletable {
            self.activityData.remove(at: dataIndex.first!)
            self.udConfig.save(activities: self.activityData)
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
