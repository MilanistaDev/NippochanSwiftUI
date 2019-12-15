//
//  PostActivity.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/12/12.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import Foundation

final class PostActivity: ObservableObject {

    // pass these data to send activity view
    @Published var isShowDialog = false // Flag indicating whether to display the communication result as an alert
    @Published var isSuccess = false    // Flag whether the post was successful
    @Published var message = ""         // Error or Success messgae for alert

    /// Post User's Activity to Slack
    /// - Parameter word: User's Activity
    func post(activity: ActivityModel) {
        let webhookUrl = UDConfig().getSettingsData(type: .webhook)

        var request = URLRequest(url: URL(string: webhookUrl)!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        // generate payload Json
        let params = PostJsonGenerator.generate(activityName: activity.name)

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
