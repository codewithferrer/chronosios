//
//  ViewModel.swift
//  chronos Watch App
//
//  Created by Daniel Ferrer on 18/3/23.
//

import Combine

class ViewModel: ObservableObject {
    
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
            }
        }
    }
    
    
    
}
