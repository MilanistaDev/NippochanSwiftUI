//
//  SendActivityView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/07/20.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct SendActivityView: View {

    @ObservedObject private var activityVM = ActivityViewModel()
    @ObservedObject var postActivity = PostActivity()

    var body: some View {
        List {
            ForEach(activityVM.activityData.indices, id: \.self) { index in
                if activityVM.activityData[index].name == "Settings" {
                    NavigationLink(destination: SettingsView(activityVM: self.activityVM)) {
                        ActivityCarouselView(activityVM: self.activityVM,
                                             dataIndex: index)
                    }
                } else if activityVM.activityData[index].name == "New Entry" {
                    NavigationLink(destination: AddActivityView(activityVM: self.activityVM)) {
                        ActivityCarouselView(activityVM: self.activityVM,
                                             dataIndex: index)
                    }
                } else {
                    Button(action: {
                        // Post actiity to Slack
                        self.postActivity.post(activity: activityVM.activityData[index])
                    }) {
                        ActivityCarouselView(activityVM: self.activityVM, 
                                             dataIndex: index)
                    }
                }
            }
            .onDelete { indexSet in
                // Delete activity with the exception of Settings.
                self.deleteData(dataIndexSet: indexSet)
            }
        }.alert(isPresented: $postActivity.isShowDialog) { () -> Alert in
            Alert(title: Text(postActivity.isSuccess ? "Success": "Failure"),
                  message: Text(postActivity.message),
                  dismissButton: .default(Text("OK")))
        }
        .listStyle(CarouselListStyle())
        .navigationBarTitle(Text("Activity List"))
    }

    /// Delete activity data from Activity List
    /// - Parameter index: Index of the corresponding data of Activity List
    private func deleteData(dataIndexSet: IndexSet) {
        activityVM.deleteActivity(dataIndex: dataIndexSet)
    }
}

#if DEBUG
struct SendActivityView_Previews: PreviewProvider {
    static var previews: some View {
        SendActivityView()
    }
}
#endif
