//
//  GameScene.swift
//  whackadot
//
//  Created by Tassos Lambrou on 7/5/16.
//  Copyright (c) 2016 Tassos & Jenny Inc. All rights reserved.
//

import SpriteKit

enum GameState{ case title, ready, playing, gameover}

class GameScene: SKScene {
    
    var gridNode: Grid!
    
    
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        gridNode = childNodeWithName("gridNode") as! Grid
        
        
        
        
        /* Create an SKAction based timer, 0.5 second delay */
        let delay = SKAction.waitForDuration(0.35)
        
        /* Call the stepSimulation() method to advance the simulation */
        let callMethod = SKAction.performSelector(#selector(GameScene.time), onTarget: self)
        
        /* Create the delay,step cycle */
        let stepSequence = SKAction.sequence([delay,callMethod])
        
        /* Create an infinite simulation loop */
        let simulation = SKAction.repeatActionForever(stepSequence)
        
        /* Run simulation action */
        self.runAction(simulation)
        
        /* Default simulation to pause state */
        self.paused = false
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
    }
    
    func time () {
        gridNode.addDotToEmptyGrid()
        
    }
    
    
    
    
    
}
