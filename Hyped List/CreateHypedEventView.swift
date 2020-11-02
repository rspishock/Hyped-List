//
//  CreateHypedEventView.swift
//  Hyped List
//
//  Created by Ryan Spishock on 11/2/20.
//

import SwiftUI

struct CreateHypedEventView: View {
    
    @ StateObject var hypedEvent = HypedEvent()
    @State var showTime = false
    
    var body: some View {
        Form {
            Section {
                FormLabelView(title: "Title", iconSystemName: "keyboard", color: .green)
                TextField("Family Vacation", text: $hypedEvent.title)
                .autocapitalization(.words)
            }       // Section
            
            Section {
                FormLabelView(title: "Date", iconSystemName: "calendar", color: .blue)
                DatePicker("Date", selection: $hypedEvent.date, displayedComponents: showTime ? [.date, .hourAndMinute] : [.date])
                    .datePickerStyle(GraphicalDatePickerStyle())
                Toggle(isOn: $showTime) {
                    FormLabelView(title: "Time", iconSystemName: "clock.fill", color: .blue)
                }
            }       // Section
            
            Section {
                ColorPicker(selection: $hypedEvent.color) {
                    FormLabelView(title: "Color", iconSystemName: "eyedropper", color: .yellow)
                }   // ColorPicker
            }       // Section
            
            Section {
                FormLabelView(title: "URL", iconSystemName: "link", color: .orange)
                TextField("google.com", text: $hypedEvent.url)
                    .keyboardType(.URL)
                    .autocapitalization(.none)
            }       // Section
            
        }           // Form
    }               // View
}

struct CreateHypedEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateHypedEventView()
    }
}
