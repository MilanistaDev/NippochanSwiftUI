//
//  UDConfig.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/08/13.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import Foundation

let firstActivityDataSet: [ActivityModel] = [
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
    @UserDefault(UserDefaultsKey.activityData, defaultValue: firstActivityDataSet)
    static var activityData: [ActivityModel]
}

struct UserDefaultsKey {
    static let activityData = "ActivityData"
    static let slackWebhookUrl = "SlackWebhookURL"
    static let gitHubUrl = "GitHubURL"
    static let favoriteColor = "FavoriteColor"
}

class UDConfig {
    /// Save New Activity List
    /// - Parameter activities: New activity list
    func save(activities: [ActivityModel]) {
        let data = activities.map { try? JSONEncoder().encode($0)}
        UserDefaults.standard.set(data, forKey: UserDefaultsKey.activityData)
    }

    /// Load Latest Activity List
    func loadActivityList() -> [ActivityModel] {

        guard let encodeData = UserDefaults.standard.array(forKey: UserDefaultsKey.activityData) as? [Data] else {
            return firstActivityDataSet
        }
        return encodeData.map { try! JSONDecoder().decode(ActivityModel.self, from: $0) }
    }

    /// Return Setting Info from UserDefaults
    /// - Parameter type: SettingsType
    func getSettingsData(type: SettingType) -> String {
        switch type {
        case .webhook:
            if let webHookUrl = UserDefaults.standard.string(forKey: UserDefaultsKey.slackWebhookUrl) {
                return webHookUrl
            } else {
                return ""
            }
        case .github:
            if let githubUrl = UserDefaults.standard.string(forKey: UserDefaultsKey.gitHubUrl) {
                return githubUrl
            } else {
                return ""
            }
        case .favColor:
            if let favoriteColorCode = UserDefaults.standard.string(forKey: UserDefaultsKey.favoriteColor) {
                return favoriteColorCode
            } else {
                return ""
            }
        }
    }
}
