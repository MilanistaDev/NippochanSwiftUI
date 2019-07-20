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
            Text(appVersion ?? "なし")
            Text("Takuya Aso, 2019")
        }
    }
}

#if DEBUG
struct AppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoView()
    }
}
#endif
