//
//  EditActivityView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2020/11/18.
//  Copyright © 2020 Takuya Aso. All rights reserved.
//

import SwiftUI

struct EditActivityView: View {

    @ObservedObject var activityVM: ActivityViewModel
    var selectedDataIndex: Int

    var body: some View {
        ActivityFormView(activityVM: self.activityVM, activity: $activityVM.activityData[selectedDataIndex],
                         formType: .edit(selectedDataIndex: selectedDataIndex))
    }
}

struct EditActivityView_Previews: PreviewProvider {
    static var previews: some View {
        EditActivityView(activityVM: ActivityViewModel(),
                         selectedDataIndex: 0)
    }
}
