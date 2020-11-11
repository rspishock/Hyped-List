//
//  DataController.swift
//  Hyped List
//
//  Created by Ryan Spishock on 11/11/20.
//

import Foundation

class DataController: ObservableObject {
    static var shared = DataController()
    
    @Published var hypedEvents: [HypedEvent] = []
}
