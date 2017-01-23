//
//  GameScene.swift
//  whackadot
//
//  Created by Tassos Lambrou on 7/5/16.
//  Copyright (c) 2016 Tassos & Jenny Inc. All rights reserved.
//

import Foundation
import SpriteKit
import GameKit

enum GameState{ case title, ready, playing, gameover}
var matchLabel: SKLabelNode!
var scoreLabel: SKLabelNode!
var restartMenu: SKSpriteNode!
var restartButton: MSButtonNode!
var finalScoreLabel: SKLabelNode!
var highScoreLabel: SKLabelNode!
var finalHiScoreLabel: SKLabelNode!
var gameCenter: MSButtonNode!

var score: Int = 0 {
didSet {
    scoreLabel.text = String(score)
}
}
var gameState: GameState = .title


let colorGoal = ColorGoal()
var spark: Bool = false{
didSet {
    
}
}

let gameManager = GameManager.sharedInstance

class GameScene: SKScene, GKGameCenterControllerDelegate {
    
    var gridNode: Grid!
    
    
    //var anyColorNode: SKNode!
    
    
    override func didMove(to view: SKView) {
        scene?.addChild(colorGoal)
    

        
        /* Setup your scene here */


        gameState = .ready
        
        gridNode = childNode(withName: "gridNode") as! Grid
        scoreLabel = childNode(withName: "scoreLabel") as! SKLabelNode
        matchLabel = childNode(withName: "matchLabel") as! SKLabelNode
        finalScoreLabel = childNode(withName: "//finalScoreLabel") as! SKLabelNode
        finalHiScoreLabel = childNode(withName: "//finalHiScoreLabel") as! SKLabelNode
        finalHiScoreLabel.text = String(gameManager.highScore)
        //anyColorNode = childNodeWithName("anyColorNode")
        //anyColorNode.hidden = true
        restartMenu = childNode(withName: "restartMenu") as! SKSpriteNode
        restartMenu.isHidden = true
        
        restartButton = childNode(withName: "restartButton") as! MSButtonNode
        gameCenter = childNode(withName: "//gameCenter") as! MSButtonNode
        
        
        /* Setup restart button selection handler */
        restartButton.selectedHandler = {
            
            /* Grab reference to our SpriteKit view */
            let skView = self.view as SKView!
            
            /* Load Game scene */
            let scene = GameScene(fileNamed:"GameScene") as GameScene!
            
            //Resets the score for each round :^)
            score = 0
            
            /* Ensure correct aspect mode */
            scene?.scaleMode = .aspectFit
            
            /* Restart game scene */
            skView?.presentScene(scene)
            
        }
        /* Hide restart button */
        restartButton.state = .hidden
        
        /* Setup restart button selection handler */
        gameCenter.selectedHandler = {
            
            self.showLeaderBoard()
        }
        
        /* Create an SKAction based timer, 0.5 second delay */
        let delay = SKAction.wait(forDuration: 0.35)
        
        /* Call the stepSimulation() method to advance the simulation */
        let callMethod = SKAction.perform(#selector(GameScene.time), onTarget: self)
        
        /* Create the delay,step cycle */
        let stepSequence = SKAction.sequence([delay,callMethod])
        
        /* Create an infinite simulation loop */
        let simulation = SKAction.repeatForever(stepSequence)
        
        /* Run simulation action */
        self.run(simulation)
        
        /* Default simulation to pause state */
        self.isPaused = false
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
        if gridNode.countDots(.inactive) == 0 {
            gameover()
        }
        
    }
    
    func time () {
        
        //Makes the game unable to spawn dots once game is over
        if gameState == .gameover{return}
        
        
        gridNode.addDotToEmptyGrid()
        
    }
    
    

    func gameover(){
        
        gameState = .gameover
        
        
        // Evaluate & Set High Score
        if score > (gameManager.highScore) {
            gameManager.highScore = score
            //                            highScoreLabel.text = String(gameManager.highScore)
            finalHiScoreLabel.text = String(gameManager.highScore)
            
        }
        
        
        // Add to the leaderboard
        saveHighscore(score)
        
        finalScoreLabel.text = String(score)
        //Reseting the colour of the circle and removing when game is over
        colorGoal.state = .inactive
        colorGoal.removeFromParent()
        
        /* Grab reference to our SpriteKit view */
        let skView = self.view as SKView!
        
        
        /* Load Game scene */
        let scene = GameScene(fileNamed:"GameScene") as GameScene!
        
        /* Ensure correct aspect mode */
        
        
        scene?.scaleMode = .aspectFit
        restartMenu.isHidden = false
        restartButton.state = .active

        
        if restartButton.state == .hidden{
            /* Restart GameScene */
            skView?.presentScene(scene)
            
            /* Start game */
            gameState = .ready
            
        }
        
    }

    func saveHighscore(_ number : Int){
        
        if GKLocalPlayer.localPlayer().isAuthenticated {
            
            let scoreReporter = GKScore(leaderboardIdentifier: "leaderboard")
            
            scoreReporter.value = Int64(number)
            
            let scoreArray : [GKScore] = [scoreReporter]
            
            GKScore.report(scoreArray, withCompletionHandler: nil)
            
        }
        
        
    }
    
    
    func showLeaderBoard(){
        let viewController = self.view!.window?.rootViewController
        let gcvc = GKGameCenterViewController()
        
        gcvc.gameCenterDelegate = self
        
        viewController?.present(gcvc, animated: true, completion: nil)
    }
    

    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
        
    }
    
}


