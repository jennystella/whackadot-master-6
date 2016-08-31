//
//  MSButtonNode.swift
//  whackadot
//
//  Created by Jenny Kim on 7/7/16.
//  Copyright © 2016 Tassos & Jenny Inc. All rights reserved.
//

import SpriteKit

enum MSButtonNodeState {
    case Active, Selected, Hidden
}

class MSButtonNode: SKSpriteNode {
    
    /* Setup a dummy action closure */
    var selectedHandler: () -> Void = { print("No button action set") }
    
    /* Button state management */
    var state: MSButtonNodeState = .Active {
        didSet {
            switch state {
            case .Active:
                /* Enable touch */
                self.userInteractionEnabled = true
                
                /* Visible */
                self.alpha = 1
                break
            case .Selected:
                /* Semi transparent */
                self.alpha = 0.7
                break
            case .Hidden:
                /* Disable touch */
                self.userInteractionEnabled = false
                
                /* Hide */
                self.alpha = 0
                break
            }
        }
    }
    
    /* Support for NSKeyedArchiver (loading objects from SK Scene Editor */
    required init?(coder aDecoder: NSCoder) {
        
        /* Call parent initializer e.g. SKSpriteNode */
        super.init(coder: aDecoder)
        
        /* Enable touch on button node */
        self.userInteractionEnabled = true
    }
    
    // MARK: - Touch handling
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        state = .Selected
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        selectedHandler()
        state = .Active
    }
    
}
