//
//  AddActivityView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/07/20.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct AddActivityView: View {
    @State var isShown = false
    @State var activityName: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text("Input new Activity")
                .font(.headline)
            TextField("出社", text: $activityName)
                    .foregroundColor(.gray)
            Text("Current: 10")
            Spacer()
            Button(action: {
                self.isShown = true
            }) {
                Text("Register")
            }.alert(isPresented: $isShown, content: {
                    Alert(title: Text("Success"),
                          message: Text("Registered new Activity."),
                          dismissButton: Alert.Button.default(Text("OK")))
                        })
                }
                .navigationBarTitle(Text("Add Activity"))
    }
}

#if DEBUG
struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView()
    }
}
#endif
