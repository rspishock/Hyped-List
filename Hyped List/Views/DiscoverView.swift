//
//  DiscoverView.swift
//  Hyped List
//
//  Created by Ryan Spishock on 1/2/21.
//

import SwiftUI

struct DiscoverView: View {
    
    @ObservedObject var data = DataController.shared
    
    
    
    var body: some View {
        HypedEventListView(hypedEvents: data.discoverHypedEvents.sorted { $0.date > $1.date }, noEventsText: "Loading upcoming events...")
            .navigationTitle("Discover")
            .navigationBarItems(trailing:
                                    Button(action: {data.getDiscoverEvents()}) {
                                        Image(systemName: "arrow.clockwise")
                                            .font(.title)
                                    }   // Button
            )
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
