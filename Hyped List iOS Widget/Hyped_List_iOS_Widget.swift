//
//  Hyped_List_iOS_Widget.swift
//  Hyped List iOS Widget
//
//  Created by Ryan Spishock on 2/1/21.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> HypedEventEntry {
        HypedEventEntry(date: Date(), hypedEvent: testHypedEvent1)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (HypedEventEntry) -> ()) {
        let entry = HypedEventEntry(date: Date(), hypedEvent: testHypedEvent1)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [HypedEventEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = HypedEventEntry(date: entryDate, hypedEvent: testHypedEvent1)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct HypedEventEntry: TimelineEntry {
    let date: Date
    let hypedEvent: HypedEvent?
}

struct Hyped_List_iOS_WidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        if entry.hypedEvent != nil {
            if entry.hypedEvent!.image() != nil {
                entry.hypedEvent!.image()!
            } else {
                entry.hypedEvent!.color
            }
        } else {
            Text("No upcoming events.  Tap me to add something.")
        }
    }           // body
}               // struct

@main
struct Hyped_List_iOS_Widget: Widget {
    let kind: String = "Hyped_List_iOS_Widget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Hyped_List_iOS_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct Hyped_List_iOS_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Hyped_List_iOS_WidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: testHypedEvent1))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            
            Hyped_List_iOS_WidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: testHypedEvent1))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            
            Hyped_List_iOS_WidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: testHypedEvent1))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
            
            Hyped_List_iOS_WidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: testHypedEvent2))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            
            Hyped_List_iOS_WidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: testHypedEvent2))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            
            Hyped_List_iOS_WidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: testHypedEvent2))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
            
            Hyped_List_iOS_WidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: nil))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            
            Hyped_List_iOS_WidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: nil))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            
            Hyped_List_iOS_WidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: nil))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }           // Group
    }               // previews
}                   // struct

