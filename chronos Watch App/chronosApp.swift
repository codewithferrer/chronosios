//
//  chronosApp.swift
//  chronos Watch App
//
//  Created by Daniel Ferrer on 23/2/23.
//

import SwiftUI

@main
struct chronos_Watch_AppApp: App {
    
    @WKApplicationDelegateAdaptor var delegate: WKDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
