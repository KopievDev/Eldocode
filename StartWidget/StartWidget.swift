//
//  StartWidget.swift
//  StartWidget
//
//  Created by Ivan Kopiev on 21.06.2021.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
//        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
        SimpleEntry(date: Date(), name: "first", configuration: ConfigurationIntent())

    }

    func getSnapshot(for configuration: ConfigurationIntent,
                     in context: Context, completion: @escaping (SimpleEntry) -> ()) {
//        let entry = SimpleEntry(date: Date(), configuration: configuration)
        let entry = SimpleEntry(date: Date(), name: "first", configuration: configuration)

        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent,
                     in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
//            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            let entry = SimpleEntry(date: entryDate, name: "first", configuration: configuration)

            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    var date: Date
    
//    let date: Date
    let name: String
    let configuration: ConfigurationIntent
}

struct StartWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack{
            HStack{
                Text("Учет времени").font(.body)
                Image(uiImage: UIImage(named: entry.name)!)
            }.padding(EdgeInsets.init(top: 18, leading: 10, bottom: -10, trailing: 10))
            ZStack{
                RoundedRectangle(cornerRadius: 12).fill(Color.init(UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1).cgColor)).padding()
                VStack{
                    Image(uiImage: UIImage(named: "start")!).padding(EdgeInsets.init(top: 2, leading: 40, bottom: -2, trailing: 40))
                    Text("Запустить")
                }

            }
            
        }
    }
}

@main
struct StartWidget: Widget {
    let kind: String = "StartWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            StartWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct StartWidget_Previews: PreviewProvider {
    static var previews: some View {
        StartWidgetEntryView(entry:  SimpleEntry(date: Date(), name: "first", configuration: ConfigurationIntent()) )
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
