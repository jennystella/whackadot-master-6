//
//  Dot.swift
//  whackadot
//
//  Created by Tassos Lambrou on 7/6/16.
//  Copyright © 2016 Tassos & Jenny Inc. All rights reserved.
//


import Foundation
import SpriteKit


class ColorGoal: SKSpriteNode {
    
    /* Character side */
    var state: DotColor = .inactive
        {
        
        didSet {
            
            switch state {
            case .inactive:
                // hide the ColorGoal Sprite
                hidden = true
                
                // show the Any Color Goal Node
                parent?.childNodeWithName("anyColorNode")?.hidden = false
                break
                
            case .color1:
                parent?.childNodeWithName("anyColorNode")?.hidden = true
                let action = SKAction.setTexture(SKTexture(imageNamed: "Dot1"))
                runAction(action)
                hidden = false
                break;
                
            case .color2:
                parent?.childNodeWithName("anyColorNode")?.hidden = true
                let action = SKAction.setTexture(SKTexture(imageNamed: "Dot2"))
                runAction(action)
                hidden = false
                break;
                
            case .color3:
                parent?.childNodeWithName("anyColorNode")?.hidden = true
                let action = SKAction.setTexture(SKTexture(imageNamed: "Dot3"))
                runAction(action)
                hidden = false
                break;
                
            case .color4:
                parent?.childNodeWithName("anyColorNode")?.hidden = true
                let action = SKAction.setTexture(SKTexture(imageNamed: "Dot4"))
                runAction(action)
                hidden = false
                break;
            
            case .color5:
                let action = SKAction.setTexture(SKTexture(imageNamed: "Dot5"))
                runAction(action)
                hidden = false
                break;
            
            }
        }
        
    }
    
    //    var isAlive: Bool = false {
    //        didSet {
    //            /* Visibility */
    //            hidden = !isAlive
    //        }
    //    }
    
    
    
    init() {
        /* Initialize with 'dot' asset */
        let texture = SKTexture(imageNamed: "Dot1")
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        hidden = true
        
        /* Set Z-Position, ensure it's on top of grid */
        zPosition = 1
        
        position = CGPoint(x: 96, y: 504)
        setScale(0.9)
        
        /* Set anchor point to bottom-left */
        anchorPoint = CGPoint(x: 0, y: 0)
    
        
        
    }
    
    /* You are required to implement this for your subclass to work */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}