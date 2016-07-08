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
        
        let resourcePath = NSBundle.mainBundle().pathForResource("AnyColor", ofType: "sks")
        let anycolor = SKReferenceNode (URL: NSURL (fileURLWithPath: resourcePath!))
        colorGoal.addChild(anycolor)
        
        
    }

    /* Character side */
    var state: DotColor = .inactive
        {
        
        didSet {
            
            switch state {
            case .inactive:
                let action = SKAction.setTexture(SKTexture(imageNamed: "anycolor"))
                runAction(action)
                hidden = false
                break;
                
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
    
    

    
    /* You are required to implement this for your subclass to work */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}