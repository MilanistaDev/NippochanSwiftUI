//
//  ActivityCarouselView.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/07/28.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct ActivityCarouselView: View {

    let activity: ActivityModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(activity.emoji)
                    .font(.largeTitle)
                    .padding(Edge.Set.top, 16.0)
                    .padding(Edge.Set.leading, 16.0)
                Spacer()
                Image(systemName: "ellipsis.circle.fill")
                    .resizable()
                    .frame(width: 20.0, height: 20.0, alignment: .center)
                    .scaledToFit()
                    .padding(Edge.Set.trailing, 8.0)
                    .onTapGesture {
                        // TODO: Edit Function
                        print("Hoge")
                }
            }
            Text(activity.name)
                .font(.headline)
                .padding(Edge.Set.bottom, 16.0)
                .padding(Edge.Set.leading, 18.0)
        }
    }
}

#if DEBUG
struct ActivityCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCarouselView(activity: UserDefaultsConfig.activityData.first ?? ActivityModel(name: "サッカー", emoji: "⚽️", deletable: true))
    }
}
#endif
