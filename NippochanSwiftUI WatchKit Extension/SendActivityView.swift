//
//  SendActivityView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/07/20.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct SendActivityView: View {

    @State var activityData: [(name: String, image: String)] =
        [("出社", "🏢"), ("作業開始", "👨‍💻"),
         ("お昼休憩", "🍖"), ("作業再開", "👩‍💻"),
         ("離席", "☕️"), ("作業終了", "🍻"),
         ("早退", "🕞"), ("Settings", "✍️")]

    @State var isShown = false

    var body: some View {
        List {
            ForEach(self.activityData, id: \.name){ activity in
                if activity.name == "Settings" {
                    NavigationLink(destination: SettingsView()) {
                        ActivityCarouselView(activity: activity)
                    }
                } else {
                    Button(action: {
                        self.isShown = true
                    }) {
                        ActivityCarouselView(activity: activity)
                        .alert(isPresented: self.$isShown) { () -> Alert in
                            Alert(title: Text("登録完了"),
                                  message: Text("アクティビティを投稿しました！"),
                                  dismissButton: Alert.Button.default(Text("OK")))
                        }
                    }
                }
            }
            .onDelete { index in
                self.activityData.remove(at: index.first!)
            }
        }
        .listStyle(.carousel)
        .navigationBarTitle(Text("Activity"))
    }
}

struct ActivityCarouselView: View {

    let activity: (name: String, image: String)

    var body: some View {
        VStack(alignment: .leading) {
            Text(activity.image)
                .font(.title)
                .padding(Edge.Set.top, 16.0)
                .padding(Edge.Set.leading, 16.0)
            Text(activity.name)
                .font(.headline)
                .padding(Edge.Set.bottom, 16.0)
                .padding(Edge.Set.leading, 18.0)
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
