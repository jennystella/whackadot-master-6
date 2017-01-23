//
//  GameManager.swift
//  whackadot
//
//  Created by Tassos Lambrou on 8/19/16.
//  Copyright © 2016 Tassos & Jenny Inc. All rights reserved.
//
import Foundation

class GameManager {
    static let sharedInstance = GameManager()
    var name: String = UserDefaults.standard.string(forKey: "myName") ?? "User" {
        didSet {
            UserDefaults.standard.set(name, forKey:"myName")
            // Saves to disk immediately, otherwise it will save when it has time
            UserDefaults.standard.synchronize()
        }
    }
    
    var highScore: Int = UserDefaults.standard.integer(forKey: "myHighScore") ?? 0 {
        didSet {
            UserDefaults.standard.set(highScore, forKey:"myHighScore")
            // Saves to disk immediately, otherwise it will save when it has time
            UserDefaults.standard.synchronize()
        }
    }
}
