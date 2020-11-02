//
//  HypedEvent.swift
//  Hyped List
//
//  Created by Ryan Spishock on 11/2/20.
//

import Foundation
import SwiftUI

class HypedEvent: ObservableObject {
    var date = Date()
    var title = ""
    var url = ""
    var color = Color.purple
    var imageData: Data?
}
