//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Wayne on 2021/6/30.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    var body: some View {
        List {
            ForEach(scrums, id: \.title) {
                scrum in
                CardView(scrum: scrum)
                    .listRowBackground(scrum.color)
            }
            
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.data)
    }
}
