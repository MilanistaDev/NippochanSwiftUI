//
//  ActivityCarouselView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/07/28.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct ActivityCarouselView: View {

    @Binding var activity: ActivityModel
    var dataIndex: Int

    @State private var isPush = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(activity.emoji)
                    .font(.largeTitle)
                    .padding(Edge.Set.top, 16.0)
                    .padding(Edge.Set.leading, 16.0)
                Spacer()
                NavigationLink(destination: EditActivityView(activity: $activity, dataIndex: dataIndex), isActive: $isPush) {
                    Image(systemName: "ellipsis.circle.fill")
                        .resizable()
                        .frame(width: 20.0, height: 20.0, alignment: .center)
                        .scaledToFit()
                        .padding(Edge.Set.trailing, 8.0)
                        .onTapGesture {
                            self.isPush.toggle()
                        }
                }
            }
            Text(activity.name)
                .font(.headline)
                .padding(Edge.Set.bottom, 16.0)
                .padding(Edge.Set.leading, 18.0)
        }
    }

    /// Find the corresponding data from the list and return the index
    private func getIndex() -> Int {
        let activityData = UDConfig().loadActivityList()
        if let dataIndex = activityData.firstIndex(of: activity) {
            return dataIndex
        } else {
            // FIXME: After Editing, this error occur
            fatalError()
        }
    }
}

#if DEBUG
struct ActivityCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCarouselView(activity: .constant(firstActivityDataSet.first!), dataIndex: 0)
    }
}
#endif
