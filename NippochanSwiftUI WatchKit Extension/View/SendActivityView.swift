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
                        ActivityCarouselView(dataIndex: self.activityData.firstIndex(of: activity)!, activity: activity)
                    }
                } else {
                    Button(action: {
                        self.postActivity.post(activity: activity)
                    }) {
                        ActivityCarouselView(dataIndex: self.activityData.firstIndex(of: activity)!, activity: activity)
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
        }.alert(isPresented: $postActivity.isShowDialog) { () -> Alert in
            Alert(title: postActivity.isSuccess ? Text("Success"): Text("Failure"),
                  message: Text(postActivity.message),
                  dismissButton: .default(Text("OK")))
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
