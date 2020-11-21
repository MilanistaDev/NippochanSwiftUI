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

    /// Update / Add Activity
    /// - Parameters:
    ///   - formType: edit or new entry
    ///   - activity: Changed Activity  Or New Activity
    func updateActivityList(formType: ActivityFormType, activity: ActivityModel) {
        switch formType {
        case .new:
            // Insert new Activity before Settings
            self.activityData.insert(activity,
                                     at: self.activityData.count - 1)
        case .edit(let selectedDataIndex):
            // Update existing data
            self.activityData[selectedDataIndex] = activity
        }
        UDConfig().save(activities: self.activityData)
    }
}
