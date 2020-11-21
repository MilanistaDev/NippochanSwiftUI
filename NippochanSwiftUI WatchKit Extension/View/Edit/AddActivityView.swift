//
//  AddActivityView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/07/20.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct AddActivityView: View {

    @ObservedObject var activityVM: ActivityViewModel

    // Model For New Activity
    @State var activity: ActivityModel = ActivityModel(name: "", emoji: "🆕", deletable: true)
    @State var isPresented = false

    var body: some View {
        ActivityFormView(activityVM: self.activityVM,
                         activity: $activity,
                         formType: .new)
    }
}

#if DEBUG
struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(activityVM: ActivityViewModel(), activity: ActivityModel(name: "出社", emoji: "🏢", deletable: true))
    }
}
#endif
