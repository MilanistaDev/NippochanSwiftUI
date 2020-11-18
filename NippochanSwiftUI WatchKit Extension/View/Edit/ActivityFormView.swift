//
//  ActivityFormView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2020/11/19.
//  Copyright © 2020 Takuya Aso. All rights reserved.
//

import SwiftUI

struct ActivityFormView: View {

    @Binding var activity: ActivityModel
    var formType: ActivityFormType = .new

    @State var isPresented = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(formType.kind.title)
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
                    Text(UDConfig().loadActivityList().count.description)
                        .font(.body)
                }
                Spacer(minLength: 4.0)
                Button(action: {
                    // Register new activity or Update activiy
                    //self.updateActivity()
                }) {
                    Text(formType.kind.buttonTitle)
                        .font(.headline)
                }.alert(isPresented: $isPresented, content: {
                    Alert(title: Text("Success"),
                          message: Text(formType.kind.message),
                          dismissButton: Alert.Button.default(Text("OK")))
                    })
                    .background(Color.green)
                    .cornerRadius(10.0)
            }
            .navigationBarTitle(Text(formType.kind.naviTitle))
        }
    }
}

struct ActivityFormView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityFormView(activity: .constant(firstActivityDataSet.first!))
    }
}
