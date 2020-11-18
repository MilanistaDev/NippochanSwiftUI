//
//  EditActivityView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2020/11/18.
//  Copyright © 2020 Takuya Aso. All rights reserved.
//

import SwiftUI

struct EditActivityView: View {

    @Binding var activity: ActivityModel

    var body: some View {
        FormView(activity: $activity)
    }
}

struct FormView: View {

    @Binding var activity: ActivityModel
    @State var isPresented = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Edit Activity")
                    .font(.headline)
                HStack {
                    TextField("出社", text: $activity.name)
                        .foregroundColor(.gray)
                    TextField("🆕", text: $activity.emoji)
                        .frame(width: 36.0)
                }.padding(Edge.Set.bottom, 12.0)
                HStack {
                    Spacer()
                    Text("Current: ")
                        .font(.footnote)
                        .foregroundColor(.yellow)
                    Text("100")
                        .font(.body)
                }
                Spacer(minLength: 4.0)
                Button(action: {
                    // Register new activity or Update activiy
                    //self.registerActivity()
                }) {
                    Text("UPDATE")
                        .font(.headline)
                }.alert(isPresented: $isPresented, content: {
                    Alert(title: Text("Success"),
                          message: Text("Activity data has been updated."),
                          dismissButton: Alert.Button.default(Text("OK")))
                    })
                    .background(Color.green)
                    .cornerRadius(10.0)
            }
            .navigationBarTitle(Text("Edit Activity"))
            .onAppear {
                //self.activityData = self.udConfig.loadActivityList()
            }
        }
    }
}

struct EditActivityView_Previews: PreviewProvider {
    static var previews: some View {
        EditActivityView(activity: .constant(firstActivityDataSet.first!))
    }
}
