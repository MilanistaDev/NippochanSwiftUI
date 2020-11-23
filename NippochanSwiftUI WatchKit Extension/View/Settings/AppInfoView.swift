//
//  AppInfoView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/07/20.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct AppInfoView: View {
    let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    var body: some View {
        VStack(alignment: .center) {
            Text("勤怠ちゃん")
                .font(.headline)
                .foregroundColor(.yellow)
                .padding(.top, 12.0)
            Text(appVersion ?? "")
                .font(.title)
                .padding()
            Text("Kintai-chan, 2019-2020")
                .font(.footnote)
                .foregroundColor(.green)
            Text("Takuya Aso")
                .font(.footnote)
                .foregroundColor(.green)
                .padding(.bottom, 8.0)
        }
        .navigationBarTitle("App Version")
    }
}

#if DEBUG
struct AppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoView()
    }
}
#endif
