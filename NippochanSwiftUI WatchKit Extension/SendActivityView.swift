//
//  SendActivityView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/07/20.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct SendActivityView: View {

    let activityData: [(name: String, image: String)] =
        [("出社", "icn_company"), ("作業開始", "icn_company"),
         ("お昼休憩", "icn_company"), ("作業再開", "icn_company"),
         ("離席", "icn_company"), ("作業終了", "icn_company"),
         ("早退", "icn_company"), ("Settings", "icn_settings")]

    @State var isShown = false

    var body: some View {
        List(0..<self.activityData.count) { number in
            if (number != self.activityData.count - 1) {
                Button(action: {
                    self.isShown = true
                }) {
                    VStack(alignment: .leading) {
                        Image(self.activityData[number].image)
                            .resizable()
                            .frame(width: 60.0, height: 60.0, alignment: .leading)
                            .padding(Edge.Set.top, 16.0)
                            .padding(Edge.Set.leading, 16.0)
                        Text(self.activityData[number].name)
                            .font(.headline)
                            .padding(Edge.Set.bottom, 16.0)
                            .padding(Edge.Set.leading, 18.0)
                    }
                    .alert(isPresented: self.$isShown) { () -> Alert in
                        Alert(title: Text("登録完了"), message: Text("アクティビティを投稿しました！"), dismissButton: Alert.Button.default(Text("OK")))
                    }

                }
            } else {
                NavigationLink(destination: SettingsView()) {
                    VStack(alignment: .leading) {
                        Image(self.activityData[number].image)
                            .resizable()
                            .frame(width: 60.0, height: 60.0, alignment: .leading)
                            .padding(Edge.Set.top, 16.0)
                            .padding(Edge.Set.leading, 16.0)
                        Text(self.activityData[number].name)
                            .font(.headline)
                            .padding(Edge.Set.bottom, 16.0)
                            .padding(Edge.Set.leading, 18.0)
                    }
                }
            }
        }
        .listStyle(.carousel)
        .navigationBarTitle(Text("Activity"))
    }
}

#if DEBUG
struct SendActivityView_Previews: PreviewProvider {
    static var previews: some View {
        SendActivityView()
    }
}
#endif
