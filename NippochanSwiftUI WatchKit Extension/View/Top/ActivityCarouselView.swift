//
//  ActivityCarouselView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/07/28.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct ActivityCarouselView: View {

    @ObservedObject var activityVM: ActivityViewModel
    var dataIndex: Int

    @State private var isPush = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(self.activityVM.activityData[dataIndex].emoji)
                    .font(.largeTitle)
                    .padding(Edge.Set.top, 16.0)
                    .padding(Edge.Set.leading, 16.0)
                Spacer()
                NavigationLink(destination: EditActivityView(activityVM: self.activityVM, selectedDataIndex: dataIndex), isActive: $isPush) {
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
            Text(self.activityVM.activityData[dataIndex].name)
                .font(.headline)
                .padding(Edge.Set.bottom, 16.0)
                .padding(Edge.Set.leading, 18.0)
        }
    }
}

#if DEBUG
struct ActivityCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCarouselView(activityVM: ActivityViewModel(),
                             dataIndex: 0)
    }
}
#endif
