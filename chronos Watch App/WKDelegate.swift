//
//  WKDelegate.swift
//  chronos Watch App
//
//  Created by Daniel Ferrer on 23/2/23.
//

import Foundation
import WatchKit
import Combine



class WKDelegate: NSObject, WKApplicationDelegate {
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    let timer = Timer.publish(every: 1, on: .main, in: .default)
        .autoconnect()
        .sink { _ in
            //print($0)
        }
    
    func applicationDidBecomeActive() {
        //print("APP active")
    }
    
    func applicationDidEnterBackground() {
        //print("APP background")
    }
    
    func applicationDidFinishLaunching() {
        //print("APP finish launching")
        
        //timer.store(in: &cancellableSet)
    }
    
    func applicationWillEnterForeground() {
        //print("APP enter foreground")
    }
    
}
