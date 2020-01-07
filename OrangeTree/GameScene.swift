//
//  GameScene.swift
//  OrangeTree
//
//  Created by Nicholas Kearns on 1/7/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    
    var orangeTree: SKSpriteNode!
    var orange: Orange?
    
    override func didMove(to view: SKView) {
        orangeTree = childNode(withName: "tree") as! SKSpriteNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        
        
        if atPoint(location).name == "tree" {
            orange = Orange()
            orange?.position = location
//            orange?.physicsBody?.isDynamic = false
            addChild(orange!)
            
//            touchStart = location
            
            
            let vector = CGVector(dx: 100, dy: 0)
            orange?.physicsBody?.applyImpulse(vector)
            
        }
        
    }
    
    
}
