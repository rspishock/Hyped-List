//
//  HypedEventTileView.swift
//  Hyped List
//
//  Created by Ryan Spishock on 11/11/20.
//

import SwiftUI

struct HypedEventTileView: View {
    
    @ObservedObject var hypedEvent: HypedEvent
    
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
            }   // HStack
            .background(Color.white)
            
            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(.red)
                Text(hypedEvent.dateAsString())
                Spacer()
                Text(hypedEvent.timeFromNow())
                Image(systemName: "clock.fill")
                    .foregroundColor(.blue)
            }   // HStack
            .font(.title3)
            .padding(.horizontal, 10)
            .padding(.bottom, 30)

            .background(Color.white)
        }       // VStack
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
    }           // body
}

struct HypedEventTileView_Previews: PreviewProvider {
    static var previews: some View {
        HypedEventTileView(hypedEvent: testHypedEvent1)
    }
}
