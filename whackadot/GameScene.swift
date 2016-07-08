//
//  GameScene.swift
//  whackadot
//
//  Created by Tassos Lambrou on 7/5/16.
//  Copyright (c) 2016 Tassos & Jenny Inc. All rights reserved.
//

import SpriteKit

enum GameState{ case Title, Ready, Playing, Gameover}
var matchLabel: SKLabelNode!
var scoreLabel: SKLabelNode!
var score: Int = 0 {
didSet {
    scoreLabel.text = String(score)
}
}
var gameState: GameState = .Ready
var highScore: Int?

let colorGoal = ColorGoal()

class GameScene: SKScene {
    
    var gridNode: Grid!
    
    var restartButton: MSButtonNode!
    var restartMenu: SKSpriteNode!
    var anyColorNode: SKNode!
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */

        
        gridNode = childNodeWithName("gridNode") as! Grid
        scoreLabel = childNodeWithName("scoreLabel") as! SKLabelNode
        matchLabel = childNodeWithName("scoreLabel") as! SKLabelNode
        anyColorNode = childNodeWithName("anyColorNode")
        anyColorNode.hidden = true
        restartMenu = childNodeWithName("restartMenu") as! SKSpriteNode
        restartMenu.alpha = 0.0
        
        
        restartButton = childNodeWithName("restartButton") as! MSButtonNode
        
        /* Setup restart button selection handler */
        restartButton.selectedHandler = {
            
            /* Grab reference to our SpriteKit view */
            let skView = self.view as SKView!
            
            /* Load Game scene */
            let scene = GameScene(fileNamed:"GameScene") as GameScene!
            
            /* Ensure correct aspect mode */
            scene.scaleMode = .AspectFill
            
            /* Restart game scene */
            skView.presentScene(scene)
            
        }
        /* Hide restart button */
        restartButton.state = .Hidden
        
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
        print(colorGoal.state)
        if gridNode.countDots(.inactive) == 0 {
            gameover()
        }
        
    }
    
    func time () {
        
        //Makes the game unable to recreate circles once game is over
        if gameState == .Gameover{return}
        
        
        gridNode.addDotToEmptyGrid()
        
    }
    
    
    func gameover(){
        
        gameState = .Gameover
        
        /* Grab reference to our SpriteKit view */
        let skView = self.view as SKView!
        
        /* Load Game scene */
        let scene = GameScene(fileNamed:"GameScene") as GameScene!
        
        /* Ensure correct aspect mode */
        scene.scaleMode = .AspectFill
        restartMenu.alpha = 1.0
        restartButton.state = .Active
        
        if restartButton.state == .Hidden{
            
            /* Restart GameScene */
            skView.presentScene(scene)
            
            /* Start game */
            gameState = .Ready
            
        }
        
    }

    
    
    
}


