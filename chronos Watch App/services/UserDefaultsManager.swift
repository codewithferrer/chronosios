//
//  UserDefaultsManager.swift
//  chronos Watch App
//
//  Created by Daniel Ferrer on 23/3/23.
//

import Foundation

class UserDefaultsManager {

    public enum StoredKeys: String {
        case IS_RUNNING = "IS_RUNNING"
        case CURRENT_TIME_REMAIN = "CURRENT_TIME_REMAIN"
        case TIME_TO_BACKGROUND = "TIME_TO_BACKGROUND"
    }
    
    func save(value: Any, key: StoredKeys) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    func remove(key: StoredKeys) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
    
    func getInt(key: StoredKeys) -> Int {
        return UserDefaults.standard.integer(forKey: key.rawValue)
    }

    func getBool(key: StoredKeys) -> Bool {
        return UserDefaults.standard.bool(forKey: key.rawValue)
    }

    func getDouble(key: StoredKeys) -> Double {
        return UserDefaults.standard.double(forKey: key.rawValue)
    }

}
