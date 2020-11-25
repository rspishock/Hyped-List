//
//  CreateHypedEventView.swift
//  Hyped List
//
//  Created by Ryan Spishock on 11/2/20.
//

import SwiftUI

struct CreateHypedEventView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var hypedEvent = HypedEvent()
    @State var showTime = false
    @State var showImagePicker = false
    
    var body: some View {
        NavigationView {
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
                    if hypedEvent.image() == nil {
                        HStack {
                            FormLabelView(title: "Image", iconSystemName: "camera", color: .purple)
                            
                            Spacer()
                            
                            Button(action: {showImagePicker = true}) {
                                Text("Pick Image")
                            }       // .button
                        }           // HStack
                    } else {        // if statement
                        HStack {
                            FormLabelView(title: "Image", iconSystemName: "camera", color: .purple)
                            
                            Spacer()
                            
                            Button(action: {hypedEvent.imageData = nil}) {
                                Text("Remove Image")
                                    .foregroundColor(.red)
                            }       // .button
                            .buttonStyle(BorderlessButtonStyle())
                        }           // HStack
                        
                        Button(action: {hypedEvent.imageData = nil}) {
                            hypedEvent.image()!
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }           // Button
                        .buttonStyle(BorderlessButtonStyle())
                    }               // else
                }                   // Section
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(imageData: $hypedEvent.imageData)
                }                   // .sheet
                
                Section {
                    ColorPicker(selection: $hypedEvent.color) {
                        FormLabelView(title: "Color", iconSystemName: "eyedropper", color: .yellow)
                    }               // ColorPicker
                }                   // Section
                
                Section {
                    FormLabelView(title: "URL", iconSystemName: "link", color: .orange)
                    TextField("google.com", text: $hypedEvent.url)
                        .keyboardType(.URL)
                        .autocapitalization(.none)
                }       // Section
            }           // Form
            .navigationBarItems(leading: Button(action: {presentationMode.wrappedValue.dismiss()}) {
                Text("Cancel")
            }, trailing: Button(action: {
                DataController.shared.hypedEvents.append(hypedEvent)
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Done")
            })          // navigagtionBarItems
            .navigationTitle("Create")
        }               // NavigationView
    }                   // View
}

struct CreateHypedEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateHypedEventView()
    }
}
