//
//  AddActivityView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/07/20.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct AddActivityView: View {

    let udConfig: UDConfig = UDConfig()
    var dataIndex = -1
    @State var isPresented = false
    @State var activityName: String = ""
    @State var activityEmoji: String = "🆕"
    @State var activityData: [ActivityModel] = []

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(dataIndex == -1 ? "New Activity" : "Edit Activity")
                    .font(.headline)
                HStack {
                    TextField("出社", text: $activityName)
                        .foregroundColor(.gray)
                    TextField("🆕", text: $activityEmoji)
                        .frame(width: 36.0)
                }.padding(Edge.Set.bottom, 12.0)
                HStack {
                    Spacer()
                    Text("Current: ")
                        .font(.footnote)
                        .foregroundColor(.yellow)
                    Text(self.activityData.count.description)
                        .font(.body)
                }
                Spacer(minLength: 4.0)
                Button(action: {
                    self.isPresented.toggle()
                    self.registerActivity(activityName: self.activityName,
                                          emoji: self.activityEmoji)
                }) {
                    Text(dataIndex == -1 ? "REGISTER": "UPDATE")
                        .font(.headline)
                }.alert(isPresented: $isPresented, content: {
                    Alert(title: Text("Success"),
                          message: Text(dataIndex == -1 ? "The new activity has been registered.": "Activity data has been updated."),
                          dismissButton: Alert.Button.default(Text("OK")))
                    })
                    .background(Color.green)
                    .cornerRadius(10.0)
            }
            .navigationBarTitle(Text(dataIndex == -1 ? "Add Activity": "Edit Activity"))
            .onAppear {
                self.activityData = self.udConfig.loadActivityList()
            }
        }
    }

    /// Save activity data to User Defaults
    /// - Parameters:
    ///   - activityName: activity name
    ///   - emoji: emoji for new activity
    private func registerActivity(activityName: String, emoji: String) {
        // Add New Acivity.
        if dataIndex == -1 {
            self.activityData
            .insert(ActivityModel(name: activityName,
                                  emoji: activityEmoji,
                                  deletable: true),
                    at: self.activityData.count - 1)
        } else {
            // Rewrite existing data.
            self.activityData.remove(at: self.dataIndex)
            self.activityData.insert(ActivityModel(name: activityName,
                                                   emoji: emoji,
                                                   deletable: true),
                                     at: self.dataIndex)
        }
        self.udConfig.save(activities: self.activityData)
    }
}

#if DEBUG
struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView()
    }
}
#endif
