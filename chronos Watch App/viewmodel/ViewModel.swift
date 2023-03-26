//
//  ViewModel.swift
//  chronos Watch App
//
//  Created by Daniel Ferrer on 18/3/23.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    private let notificationsManager = NotificationsManager()
    private let userDefaultsManager = UserDefaultsManager()
    @Published var remainTime: Int = 5 * 60
    
    private var isStarted: Bool = false
    
    public func startCounter() {
        isStarted = true
    }
    
    public func resetCounter() {
        isStarted = false
        remainTime = 5 * 60
    }
    
    public func decreaseTime() {
        if isStarted {
            remainTime -= 1
            
            if remainTime <= 0 {
                remainTime = 0
                isStarted = false
                notificationsManager.createForegroundNotification()
            }
        }
    }
    
    public func prepareForBackground() {
        userDefaultsManager.save(value: isStarted, key: .IS_RUNNING)
        userDefaultsManager.save(value: remainTime, key: .CURRENT_TIME_REMAIN)
        userDefaultsManager.save(value: Date().timeIntervalSince1970, key: .TIME_TO_BACKGROUND)
        
        notificationsManager.createBackgroundNotification(
                title: "Tiempo finalizado",
                subtitle: "Cuenta atrás finalizada",
                when: remainTime)
    }
        
    public func restoreFromBackground() {
        isStarted = userDefaultsManager.getBool(key: .IS_RUNNING)
        
        notificationsManager.cancelNotifications()
            
        if isStarted {
            var _remainTime = userDefaultsManager.getInt(key: .CURRENT_TIME_REMAIN)
            let _timeGoToBackground = userDefaultsManager.getDouble(key: .TIME_TO_BACKGROUND)
            let _timeGoToForeground = Date().timeIntervalSince1970
            
            let _timeElapsed = _timeGoToForeground - _timeGoToBackground
            
            _remainTime = _remainTime - Int(_timeElapsed)
            
            if _remainTime <= 0 {
                resetCounter()
            } else {
                remainTime = _remainTime
            }
            
        } else {
            resetCounter()
        }
        
    }
    
    public func requestPermission() {
        notificationsManager.requestPermission()
    }
    
    
    
}
