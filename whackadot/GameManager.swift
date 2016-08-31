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
    var name: String = NSUserDefaults.standardUserDefaults().stringForKey("myName") ?? "User" {
        didSet {
            NSUserDefaults.standardUserDefaults().setObject(name, forKey:"myName")
            // Saves to disk immediately, otherwise it will save when it has time
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    var highScore: Int = NSUserDefaults.standardUserDefaults().integerForKey("myHighScore") ?? 0 {
        didSet {
            NSUserDefaults.standardUserDefaults().setInteger(highScore, forKey:"myHighScore")
            // Saves to disk immediately, otherwise it will save when it has time
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
}