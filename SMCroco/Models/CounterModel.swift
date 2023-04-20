//
//  CounterModel.swift
//  SMCroco
//
//  Created by Damir Zaripov on 20.04.2023.
//

import UIKit

class CounterModel {
    static let shared = CounterModel()
    private let userDefaults = UserDefaults.standard
    private let counterKey = "counter"
    
    var counter: Int {
        
        get {
            return userDefaults.integer(forKey: counterKey)
        }
        
        set {
            userDefaults.set(newValue, forKey: counterKey)
        }
    }
    
    func resetCounter() {
        counter = 0
    }
}
