//
//  HypedEventDetailView.swift
//  Hyped List
//
//  Created by Ryan Spishock on 1/27/21.
//

import SwiftUI

struct HypedEventDetailView: View {
    
    @ObservedObject var hypedEvent: HypedEvent
    @State var showingCreateView = false
    var isDiscover = false
    
    
    var body: some View {
        VStack(spacing: 0) {
            if hypedEvent.image() != nil {
                hypedEvent.image()!
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }   // if statement
            
            Rectangle().foregroundColor(hypedEvent.color)
                .frame(height: 15)
            HStack {
                Text(hypedEvent.title)
                    .font(.title)
                    .padding(10)
                Spacer()
            }       // HStack
            .background(Color.white)
            
            Text("\(hypedEvent.timeFromNow().capitalized) on \(hypedEvent.dateAsString())").font(.title2)
            
            Spacer()
            
            if hypedEvent.validURL() != nil {
                Button(action: {
                    UIApplication.shared.open(hypedEvent.validURL()!)
                }) {
                    HypedEventDetailViewButton(backgroundColor: .orange, imageName: "link", text: "Visit Site")
                }       // Button
            }
            
            
            if isDiscover {
                Button(action: {
                    DataController.shared.addFromDiscover(hypedEvent: hypedEvent)
                }) {
                    HypedEventDetailViewButton(backgroundColor: .blue, imageName: "plus.circle", text: hypedEvent.hasBeenAdded ? "Added" : "Add")
                }       // Button
                .disabled(hypedEvent.hasBeenAdded)
                .opacity(hypedEvent.hasBeenAdded ? 0.5 : 1.0)
            } else {
                Button(action: {
                    showingCreateView = true
                }) {
                    HypedEventDetailViewButton(backgroundColor: .yellow, imageName: "pencil.circle", text: "Edit")
                }       // Button
                .sheet(isPresented: $showingCreateView) {
                    CreateHypedEventView(hypedEvent: hypedEvent)
                }       // .sheet
                
                Button(action: {
                    DataController.shared.deleteHypedEvent(hypedEvent: hypedEvent)
                }) {
                    HypedEventDetailViewButton(backgroundColor: .red, imageName: "trash", text: "Delete")
                }       // Button
            }
        }               // VStack
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct HypedEventDetailViewButton: View {
    
    var backgroundColor: Color
    var imageName: String
    var text: String
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: imageName)
            Text(text)
            Spacer()
            
        }   // HStack
        .font(.title2)
        .padding(12)
        .background(backgroundColor)
        .foregroundColor(.white)
        .cornerRadius(5)
        .padding(.horizontal, 20)
        .padding(.bottom, 10)
    }               // body
}                   // struct

struct HypedEventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HypedEventDetailView(hypedEvent: testHypedEvent1)
        HypedEventDetailViewButton(backgroundColor: .orange, imageName: "link", text: "Visit Site")
    }
}
