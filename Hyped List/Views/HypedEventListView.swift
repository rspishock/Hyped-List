//
//  HypedEventListView.swift
//  Hyped List
//
//  Created by Ryan Spishock on 12/26/20.
//

import SwiftUI

struct HypedEventListView: View {
    
    var hypedEvents: [HypedEvent]
    var noEventsText: String
    var isDiscover = false
    
    var body: some View {
        ScrollView {
            VStack {
                if hypedEvents.count == 0 {
                    Text(noEventsText)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.top, 50)
                        .padding(.horizontal, 20)
                } else {
                    ForEach(hypedEvents) { hypedEvent in
                        NavigationLink(
                            destination: HypedEventDetailView(hypedEvent: hypedEvent, isDiscover: isDiscover)) {
                            HypedEventTileView(hypedEvent: hypedEvent)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }   // ForEach
                }       // if statement
            }           // Vstack
        }               // ScrollView
    }                   // body
}                       // HypedEventListView

struct HypedEventListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HypedEventListView(hypedEvents: [testHypedEvent1, testHypedEvent2], noEventsText: "Nothing here")
            
            HypedEventListView(hypedEvents: [], noEventsText: "Nothing here")
        }
    }
}
