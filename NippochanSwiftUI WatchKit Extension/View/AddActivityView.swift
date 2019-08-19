//
//  AddActivityView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/07/20.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct AddActivityView: View {
    @State var isPresented = false
    @State var activityName: String = ""
    @State var activityEmoji: String = "🆕"
    @State var activitiesCount = UserDefaultsConfig.activityData.count

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("New Activity")
                    .font(.headline)
                TextField("出社", text: $activityName)
                    .foregroundColor(.gray)
                Text("Activity's emoji?")
                    .font(.headline)
                HStack {
                    TextField("🆕", text: $activityEmoji)
                        .foregroundColor(.gray)
                        .frame(width: 44.0)
                    Spacer()
                    Text("Current: ")
                        .font(.footnote)
                        .foregroundColor(.green)
                    Text(self.activitiesCount.description)
                        .font(.body)
                }
                Spacer(minLength: 6.0)
                Button(action: {
                    self.isPresented.toggle()
                }) {
                    Text("Register")
                }.alert(isPresented: $isPresented, content: {
                        Alert(title: Text("Success"),
                              message: Text("Registered new Activity."),
                              dismissButton: Alert.Button.default(Text("OK")))
                            })
                    }
                    .navigationBarTitle(Text("Add Activity"))
        }
    }
}

#if DEBUG
struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView()
    }
}
#endif
