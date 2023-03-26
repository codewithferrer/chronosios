//
//  NotificationsManager.swift
//  chronos Watch App
//
//  Created by Daniel Ferrer on 23/3/23.
//

import Foundation
import UserNotifications
import SwiftUI

class NotificationsManager {
    
    func createForegroundNotification() {
        WKInterfaceDevice.current().play(.notification)
    }
    
    func createBackgroundNotification(title: String, subtitle: String, when seconds: Int) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(seconds), repeats: false)
        
        let request = UNNotificationRequest(identifier: "myappidentifier.chronos.\(UUID().uuidString)",
                                            content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
    func requestPermission() {
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings(completionHandler: { settings in
            
            if settings.authorizationStatus != .authorized {
                center.requestAuthorization(options: [.alert, .sound, .badge]) {
                    granted, error in
                    
                    if let error = error {
                        print("error: \(error)")
                    }
                }
            }
            
        })
    }
    
}
