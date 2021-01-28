//
//  HypedEventDetailView.swift
//  Hyped List
//
//  Created by Ryan Spishock on 1/27/21.
//

import SwiftUI

struct HypedEventDetailView: View {
    
    var hypedEvent: HypedEvent
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
                Button(action: {}) {
                    HypedEventDetailViewButton(backgroundColor: .orange, imageName: "link", text: "Visit Site")
                }       // Button
            }
            
            
            if isDiscover {
                Button(action: {}) {
                    HypedEventDetailViewButton(backgroundColor: .blue, imageName: "plus.circle", text: "Add")
                }       // Button
            } else {
                Button(action: {}) {
                    HypedEventDetailViewButton(backgroundColor: .yellow, imageName: "pencil.circle", text: "Edit")
                }       // Button
                Button(action: {}) {
                    HypedEventDetailViewButton(backgroundColor: .red, imageName: "trash", text: "Delete")
                }       // Button
                
            }
            
        }           // VStack
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
        .padding(.top, 10)
    }               // body
}                   // struct

struct HypedEventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HypedEventDetailView(hypedEvent: testHypedEvent1)
        HypedEventDetailViewButton(backgroundColor: .orange, imageName: "link", text: "Visit Site")
    }
}
