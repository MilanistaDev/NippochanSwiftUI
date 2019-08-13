//
//  UDConfig.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/08/13.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import Foundation

let activityDataSet: [ActivityModel] = [
    ActivityModel(name: "出社", emoji: "🏢", deletable: true),
    ActivityModel(name: "作業開始", emoji: "👨‍💻", deletable: true),
    ActivityModel(name: "お昼休憩", emoji: "🍖", deletable: true),
    ActivityModel(name: "作業再開", emoji: "👩‍💻", deletable: true),
    ActivityModel(name: "離席", emoji: "☕️", deletable: true),
    ActivityModel(name: "作業終了", emoji: "🍻", deletable: true),
    ActivityModel(name: "早退", emoji: "🕞", deletable: true),
    ActivityModel(name: "Settings", emoji: "✍️", deletable: false)]

struct UserDefaultsConfig {
    // User's Activity Data. Set default Data Set.
    @UserDefault(UserDefaultsKey.activityData, defaultValue: activityDataSet)
    static var activityData: [ActivityModel]
}

struct UserDefaultsKey {
    static let activityData = "ActivityData"
}
