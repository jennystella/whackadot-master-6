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
        let texture = SKTexture(imageNamed: "anycolor")
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        isHidden = false
        
        /* Set Z-Position, ensure it's on top of grid */
        zPosition = 1
        
        position = CGPoint(x: 96, y: 504)
        setScale(0.9)
        
        /* Set anchor point to bottom-left */
        anchorPoint = CGPoint(x: 0, y: 0)
        
        
//        let resourcePath = NSBundle.mainBundle().pathForResource("AnyColor", ofType: "sks")
//        let anycolor = SKReferenceNode (URL: NSURL (fileURLWithPath: resourcePath!))
//        colorGoal.addChild(anycolor)
        
        
    }

    /* Character side */
    var state: DotColor = .inactive
        {
        
        didSet {
            
            switch state {
            case .inactive:
                let action = SKAction.setTexture(SKTexture(imageNamed: "anycolor"))
                run(action)
                let particles = SKEmitterNode(fileNamed: "AnyColorSpark")!
        
                /* Restrict total particles to reduce runtime of particle */
                particles.numParticlesToEmit = 25
                particles.position = CGPoint(x: 96, y: 504)
                particles.zPosition = CGFloat(3)
                /* Add particles to scene */
                addChild(particles)
                isHidden = false

                break
                
            case .color1:
                let action = SKAction.setTexture(SKTexture(imageNamed: "Dot1"))
                run(action)
                self.isHidden = false
                break;
                
            case .color2:
                let action = SKAction.setTexture(SKTexture(imageNamed: "Dot2"))
                run(action)
                self.isHidden = false
                break;
                
            case .color3:
                let action = SKAction.setTexture(SKTexture(imageNamed: "Dot3"))
                run(action)
                self.isHidden = false
                break;
                
            case .color4:
                let action = SKAction.setTexture(SKTexture(imageNamed: "Dot4"))
                run(action)
                self.isHidden = false
                break;
            
            case .color5:
                let action = SKAction.setTexture(SKTexture(imageNamed: "Dot5"))
                run(action)
                self.isHidden = false
                break;
            
            }
        }
        
    }

    

    
    /* You are required to implement this for your subclass to work */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
