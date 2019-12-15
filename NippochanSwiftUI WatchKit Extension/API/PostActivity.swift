//
//  PostActivity.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/12/12.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import Foundation

final class PostActivity: ObservableObject {

    private let watchKitIconLink = "https://user-images.githubusercontent.com/8732417/70712003-3007c600-1d26-11ea-830f-c3589ec33ebb.png"

    // pass these data to send activity view
    @Published var isShowDialog = false // Flag indicating whether to display the communication result as an alert
    @Published var isSuccess = false    // Flag whether the post was successful
    @Published var message = ""         // Error or Success messgae for alert

    /// Post User's Activity to Slack
    /// - Parameter word: User's Activity
    func post(activity: ActivityModel) {
        let webhookUrl = UDConfig().getSettingsData(type: .webhook)
        let gitHubAccount = UDConfig().getSettingsData(type: .github)
        var authorName = UDConfig().getSettingsData(type: .userName)
        if authorName.isEmpty { authorName = gitHubAccount }
        let color = UDConfig().getSettingsData(type: .favColor)  // FIXME: Need to check color code format
        let authorProfileLink = "https://github.com/" + gitHubAccount
        let authorProfileIcon = authorProfileLink + ".png"

        var request = URLRequest(url: URL(string: webhookUrl)!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        // generate data to post to slack
        var attachmentsDic = Dictionary<String, String>()
        attachmentsDic["color"] = color
        attachmentsDic["author_name"] = authorName
        attachmentsDic["author_link"] = authorProfileLink
        attachmentsDic["author_icon"] = authorProfileIcon
        attachmentsDic["text"] = activity.name
        attachmentsDic["footer"] = "via  WATCH"
        attachmentsDic["footer_icon"] = watchKitIconLink

        var attachments = Array<Any>()
        attachments.append(attachmentsDic)

        var params = Dictionary<String, Any>()
        params["attachments"] = attachments

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            self.isShowDialog = true
            self.isSuccess = false
            self.message = error.localizedDescription
        }

        let task = URLSession.shared.dataTask(with: request)
        { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                self.isShowDialog = true
                self.isSuccess = false
                self.message = error.localizedDescription
                return
            }
            guard let _ = data, let response = response as? HTTPURLResponse else {
                self.isShowDialog = true
                self.isSuccess = false
                self.message = "No data or No response."
                return
            }
            if response.statusCode == 200 {
                self.isShowDialog = true
                self.isSuccess = true
                self.message = "Posted your activity!"
            } else {
                self.isShowDialog = true
                self.isSuccess = false
                self.message = "Status Code: " + String(response.statusCode)
            }
        }
        task.resume()
    }
}
