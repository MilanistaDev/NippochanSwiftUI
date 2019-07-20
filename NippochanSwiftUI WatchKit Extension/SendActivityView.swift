//
//  SendActivityView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/07/20.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct SendActivityView: View {

    let activityData: [String] = ["出社", "作業開始", "お昼休憩", "作業再開", "離席", "作業終了", "早退", "Add Activity"]
    @State var isShown = false

    var body: some View {
        VStack(alignment: .leading) {
            List(0..<self.activityData.count) { number in
                Text(self.activityData[number])
            }
            .listStyle(.carousel)
        }
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
