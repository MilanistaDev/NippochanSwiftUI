//
//  ActivityModel.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/07/29.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct ActivityModel: Codable, Identifiable {
    var id = UUID()
    var name: String
    var emoji: String
    var deletable = false
}
