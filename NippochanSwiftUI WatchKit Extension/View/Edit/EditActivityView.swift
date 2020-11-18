//
//  EditActivityView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2020/11/18.
//  Copyright © 2020 Takuya Aso. All rights reserved.
//

import SwiftUI

struct EditActivityView: View {

    @Binding var activity: ActivityModel
    var dataIndex: Int

    var body: some View {
        ActivityFormView(activity: $activity, formType: .edit(dataIndex: dataIndex))
    }
}

struct EditActivityView_Previews: PreviewProvider {
    static var previews: some View {
        EditActivityView(activity: .constant(firstActivityDataSet.first!), dataIndex: 0)
    }
}