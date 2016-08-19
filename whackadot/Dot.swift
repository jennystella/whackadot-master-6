//
//  Dot.swift
//  whackadot
//
//  Created by Tassos Lambrou on 7/6/16.
//  Copyright © 2016 Tassos & Jenny Inc. All rights reserved.
//


import Foundation
import SpriteKit


enum DotColor { case inactive, color1, color2, color3, color4, color5 }

class Dot: SKSpriteNode {
    
    /* Character side */
    var state:DotColor = .inactive
        {
        
        didSet {
            
            switch state {
            case .inactive:
                hidden = true
                
            case .color1:
                let action = SKAction.setTexture(SKTexture(imageNamed: "Dot1"))
                runAction(action)
                hidden = false
                break;
                
            case .color2:
                let action = SKAction.setTexture(SKTexture(imageNamed: "Dot2"))
                runAction(action)
                hidden = false
                break;
                
            case .color3:
                let action = SKAction.setTexture(SKTexture(imageNamed: "Dot3"))
                runAction(action)
                hidden = false
                break;
                
            case .color4:
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
        
        size.height = 60
        size.width = 60
        /* Set Z-Position, ensure it's on top of grid */
        zPosition = 1
        
        
        /* Set anchor point to bottom-left */
        anchorPoint = CGPoint(x: 0, y: 0)
    
        
        
    }
    
    /* You are required to implement this for your subclass to work */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}