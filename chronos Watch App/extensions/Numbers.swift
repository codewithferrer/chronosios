//
//  Numbers.swift
//  chronos Watch App
//
//  Created by Daniel Ferrer on 18/3/23.
//

import Foundation

extension Int {
    
    func toMinutesSeconds() -> String {
            
        if self <= 0 {
            return "00:00"
        }
        
        let minute = Int(self) / 60 % 60
        let second = Int(self) % 60
        
        return String(format: "%02i:%02i", minute, second)
    }
}

