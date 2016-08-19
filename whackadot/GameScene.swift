//
//  GameScene.swift
//  whackadot
//
//  Created by Tassos Lambrou on 7/5/16.
//  Copyright (c) 2016 Tassos & Jenny Inc. All rights reserved.
//

import Foundation
import SpriteKit

enum GameState{ case Title, Ready, Playing, Gameover}
var matchLabel: SKLabelNode!
var scoreLabel: SKLabelNode!
var restartMenu: SKSpriteNode!
var restartButton: MSButtonNode!
var finalScoreLabel: SKLabelNode!
var highScoreLabel: SKLabelNode!
var finalHiScoreLabel: SKLabelNode!

var score: Int = 0 {
didSet {
    scoreLabel.text = String(score)
}
}
var gameState: GameState = .Title
var highScore: Int?

let colorGoal = ColorGoal()
var spark: Bool = false{
didSet {
    
}
}

let gameManager = GameManager.sharedInstance

class GameScene: SKScene {
    
    var gridNode: Grid!
    
    
    //var anyColorNode: SKNode!
    
    
    override func didMoveToView(view: SKView) {
        scene?.addChild(colorGoal)
    

        
        /* Setup your scene here */


        gameState = .Ready
        
        gridNode = childNodeWithName("gridNode") as! Grid
        scoreLabel = childNodeWithName("scoreLabel") as! SKLabelNode
        matchLabel = childNodeWithName("matchLabel") as! SKLabelNode
        finalScoreLabel = childNodeWithName("//finalScoreLabel") as! SKLabelNode
        finalHiScoreLabel = childNodeWithName("//finalHiScoreLabel") as! SKLabelNode
        finalHiScoreLabel.text = String(gameManager.highScore)
        //anyColorNode = childNodeWithName("anyColorNode")
        //anyColorNode.hidden = true
        restartMenu = childNodeWithName("restartMenu") as! SKSpriteNode
        restartMenu.hidden = true
        
        
        restartButton = childNodeWithName("restartButton") as! MSButtonNode
        /* Setup restart button selection handler */
        restartButton.selectedHandler = {
            
            /* Grab reference to our SpriteKit view */
            let skView = self.view as SKView!
            
            /* Load Game scene */
            let scene = GameScene(fileNamed:"GameScene") as GameScene!
            
            //Resets the score for each round :^)
            score = 0
            
            /* Ensure correct aspect mode */
            scene.scaleMode = .AspectFit
            
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
        if gridNode.countDots(.inactive) == 0 {
            gameover()
        }
        
    }
    
    func time () {
        
        //Makes the game unable to spawn dots once game is over
        if gameState == .Gameover{return}
        
        
        gridNode.addDotToEmptyGrid()
        
    }
    
    

    func gameover(){
        
        gameState = .Gameover
        
        
        
        finalScoreLabel.text = String(score)
        //Reseting the colour of the circle and removing when game is over
        colorGoal.state = .inactive
        colorGoal.removeFromParent()
        
        /* Grab reference to our SpriteKit view */
        let skView = self.view as SKView!
        
        
        /* Load Game scene */
        let scene = GameScene(fileNamed:"GameScene") as GameScene!
        
        /* Ensure correct aspect mode */
        
        
        scene.scaleMode = .AspectFit
        restartMenu.hidden = false
        restartButton.state = .Active

        
        if restartButton.state == .Hidden{
            /* Restart GameScene */
            skView.presentScene(scene)
            
            /* Start game */
            gameState = .Ready
            
        }
        
    }

    
    
}


