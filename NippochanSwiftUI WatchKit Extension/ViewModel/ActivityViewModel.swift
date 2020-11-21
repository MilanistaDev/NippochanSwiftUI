//
//  ActivityViewModel.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2020/11/18.
//  Copyright © 2020 Takuya Aso. All rights reserved.
//

import SwiftUI

class ActivityViewModel: ObservableObject {
    @Published var activityData: [ActivityModel] = []

    init() {
        self.activityData = UDConfig().loadActivityList()
    }

    /// Delete Activity
    /// - Parameter dataIndex: DataIndex of List
    func deleteActivity(dataIndex: IndexSet) {
        if activityData[dataIndex.first!].deletable {
            activityData.remove(atOffsets: dataIndex)
            UDConfig().save(activities: activityData)
        }
    }

    func updateActivityList() {
    }
}
