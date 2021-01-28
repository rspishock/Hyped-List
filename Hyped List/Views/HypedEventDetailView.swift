//
//  HypedEventDetailView.swift
//  Hyped List
//
//  Created by Ryan Spishock on 1/27/21.
//

import SwiftUI

struct HypedEventDetailView: View {
    
    var hypedEvent: HypedEvent
    
    
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
            
            
            Button(action: {}) {
                HStack {
                    Spacer()
                    Image(systemName: "link")
                    Text("Visit Site")
                    Spacer()
                    
                }   // HStack
                .font(.title2)
                .padding(12)
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(5)
                .padding(.horizontal, 20)
            }
        }           // VStack
    }
}

struct HypedEventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HypedEventDetailView(hypedEvent: testHypedEvent1)
    }
}
