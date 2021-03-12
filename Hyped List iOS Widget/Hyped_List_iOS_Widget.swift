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
        
        let placeholderHypedEvent = HypedEvent()
        placeholderHypedEvent.color = .green
        placeholderHypedEvent.title = "Loading..."
        
        return HypedEventEntry(date: Date(), hypedEvent: placeholderHypedEvent)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (HypedEventEntry) -> ()) {
        
        let upcoming = DataController.shared.getUpcomingForWidget()
        
        var entry = HypedEventEntry(date: Date(), hypedEvent: testHypedEvent1)
        
        if upcoming.count > 0 {
            entry = HypedEventEntry(date: Date(), hypedEvent: upcoming.randomElement())
        }
        
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [HypedEventEntry] = []
        
        let upcoming = DataController.shared.getUpcomingForWidget()
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< upcoming.count {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = HypedEventEntry(date: entryDate, hypedEvent: upcoming[hourOffset])
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
    @Environment(\.widgetFamily) var widgetFamily
    var entry: Provider.Entry
    
    var body: some View {
        GeometryReader { geometry in
            if entry.hypedEvent != nil {
                ZStack {
                    if entry.hypedEvent!.image() != nil {
                        entry.hypedEvent!.image()!
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    } else {
                        entry.hypedEvent!.color
                    }
                    Color.black
                        .opacity(0.2)
                    
                    Text(entry.hypedEvent!.title)
                        .foregroundColor(.white)
                        .font(fontSize())
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Text(entry.hypedEvent!.timeFromNow())
                                .bold()
                                .padding(10)
                                .foregroundColor(.white)
                        }       // HStack
                    }           // VStack
                }               // ZStack
            } else {
                VStack {
                    Spacer()
                    Text("No upcoming events.  Tap me to add something.")
                        .padding()
                        .multilineTextAlignment(.center)
                        .font(fontSize())
                    Spacer()
                }
            }
        }
    }           // body
    
    func fontSize() -> Font {
        switch widgetFamily {
        case .systemSmall:
            return .title2
        case .systemMedium:
            return .title
        case .systemLarge:
            return .largeTitle
        @unknown default:
            return .body
        }
    }           // fontSize()
}               // struct

@main
struct Hyped_List_iOS_Widget: Widget {
    let kind: String = "Hyped_List_iOS_Widget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Hyped_List_iOS_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("HypedEvent Widget")
        .description("See your upcoming events!.")
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

