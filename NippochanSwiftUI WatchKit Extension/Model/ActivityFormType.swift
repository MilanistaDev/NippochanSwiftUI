//
//  ActivityFormType.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2020/11/18.
//  Copyright © 2020 Takuya Aso. All rights reserved.
//

import Foundation

enum ActivityFormType: Int {
    case new
    case edit

    struct Kind {
        var naviTitle: String
        var title: String
        var buttonTitle: String
        var message: String
    }

    var kind: Kind {
        switch self {
        case .new:
            return Kind(naviTitle: "Add Activity",
                        title: "New Activity",
                        buttonTitle: "REGISTER",
                        message: "The new activity has been registered.")
        case .edit:
            return Kind(naviTitle: "Edit Activity",
                        title: "Edit Activity",
                        buttonTitle: "UPDATE",
                        message: "Activity data has been updated.")
        }
    }
}
