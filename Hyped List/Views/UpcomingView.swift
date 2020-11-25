//
//  UpcomingView.swift
//  Hyped List
//
//  Created by Ryan Spishock on 11/1/20.
//

import SwiftUI

struct UpcomingView: View {
    
    @State var showingCreateView = false
    @ObservedObject var data = DataController.shared
    
    var body: some View {
        ScrollView {
            VStack {
                if data.hypedEvents.count == 0 {
                    Text("Nothing to look forward to 😢\nCreate an event or check out the Discovery tab!")
                        .bold()
                        .multilineTextAlignment(.center)
                } else {
                    ForEach(data.hypedEvents) { hypedEvent in
                        HypedEventTileView(hypedEvent: hypedEvent)
                    }   // ForEach
                }       // if statement
                
            }           // Vstack
        }           // ScrollView
        .navigationTitle("Upcoming")
        .navigationBarItems(trailing:
                                Button(action: {showingCreateView = true}) {
                                    Image(systemName: "calendar.badge.plus")
                                        .font(.title)
                                }   // Button
                                .sheet(isPresented: $showingCreateView) {
                                    CreateHypedEventView()
                                }   // .sheet
        )
    }               // View
}                   // body

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            NavigationView {
                // Populated view
//                UpcomingView(hypedEvents: [testHypedEvent1, testHypedEvent2])
            }       //  NavigationView
        }           // Group
        
        Group {
            NavigationView {
                // Empty view
//                UpcomingView(hypedEvents: [])
            }       // NavigationView
        }           // Group
    }               // previews
}                   // PreviewProvider
