//
//  HypedEvent.swift
//  Hyped List
//
//  Created by Ryan Spishock on 11/2/20.
//

import Foundation
import SwiftUI

class HypedEvent: ObservableObject, Identifiable {
    var id = UUID().uuidString
    var date = Date()
    var title = ""
    var url = ""
    var color = Color.purple
    @Published var imageData: Data?
    
    func image() -> Image? {
        if let data = imageData {
            if let uiImage = UIImage(data: data) {
                return Image(uiImage: uiImage)
            }
        }
        return nil
    }
}

var testHypedEvent1: HypedEvent {
    let hypedEvent = HypedEvent()
    
    if let image = UIImage(named: "wwdc") {
        if let data = image.pngData() {
            hypedEvent.imageData = data
        }
    }
    
    hypedEvent.title = "WWDC 2021"
    hypedEvent.color = .green
    hypedEvent.date = Date()
    hypedEvent.url = "http://www.apple.com"
    
    return hypedEvent
}

var testHypedEvent2: HypedEvent {
    let hypedEvent = HypedEvent()
    
    hypedEvent.title = "Trip to Silicon Valley"
    hypedEvent.color = .gray
    hypedEvent.date = Date()
    
    return hypedEvent
}