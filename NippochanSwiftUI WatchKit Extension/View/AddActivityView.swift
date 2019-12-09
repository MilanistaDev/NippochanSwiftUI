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
    @State var isPresented = false
    @State var activityName: String = ""
    @State var activityEmoji: String = "🆕"
    @State var activityData: [ActivityModel] = []

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("New Activity")
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
                    Text("Register")
                        .font(.headline)
                }.alert(isPresented: $isPresented, content: {
                    Alert(title: Text("Success"),
                          message: Text("Registered new Activity."),
                          dismissButton: Alert.Button.default(Text("OK")))
                    })
                    .background(Color.green)
                    .cornerRadius(10.0)
            }
            .navigationBarTitle(Text("Add Activity"))
            .onAppear {
                self.activityData = self.udConfig.loadActivityList()
            }
        }
    }

    private func registerActivity(activityName: String, emoji: String) {

        self.activityData
            .insert(ActivityModel(name: activityName,
                                  emoji: activityEmoji,
                                  deletable: true),
                    at: self.activityData.count - 1)
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
