//
//  AddActivityView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/07/20.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct AddActivityView: View {

    @State var activity: ActivityModel
    @State var isPresented = false

    var body: some View {
        ActivityFormView(activity: $activity,
                         formType: .new)
    }
}

#if DEBUG
struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(activity: ActivityModel(name: "出社", emoji: "🏢", deletable: true))
    }
}
#endif
