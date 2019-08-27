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
                    Text(self.activitiesCount.description)
                        .font(.body)
                }
                Spacer(minLength: 4.0)
                Button(action: {
                    self.isPresented.toggle()
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
