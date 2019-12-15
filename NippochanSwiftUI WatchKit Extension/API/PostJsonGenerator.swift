//
//  PostJsonGenerator.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/12/15.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import UIKit

final class PostJsonGenerator {

    class func generate(activityName: String) -> [String: Any] {
        let udConfig = UDConfig()
        let gitHubAccount = UDConfig().getSettingsData(type: .github)
        var authorName = UDConfig().getSettingsData(type: .userName)
        if authorName.isEmpty { authorName = gitHubAccount }
        let color =  udConfig.getSettingsData(type: .favColor)  // FIXME: Need to check color code format
        let authorProfileLink = "https://github.com/" + gitHubAccount
        let authorProfileIcon = authorProfileLink + ".png"

        // generate data to post to slack
        var attachmentsDic = Dictionary<String, String>()
        attachmentsDic["color"] = color
        attachmentsDic["author_name"] = authorName
        attachmentsDic["author_link"] = authorProfileLink
        attachmentsDic["author_icon"] = authorProfileIcon
        attachmentsDic["text"] = activityName
        attachmentsDic["footer"] = "via  WATCH"
        attachmentsDic["footer_icon"] = "https://user-images.githubusercontent.com/8732417/70712003-3007c600-1d26-11ea-830f-c3589ec33ebb.png"

        var params = Dictionary<String, Any>()
        params["attachments"] = [attachmentsDic]

        return params
    }
}
