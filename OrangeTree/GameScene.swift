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
    var touchStart: CGPoint = .zero
    var shapeNode = SKShapeNode()
    
    
    
    override func didMove(to view: SKView) {
        orangeTree = childNode(withName: "tree") as! SKSpriteNode
        shapeNode.lineWidth = 20
        shapeNode.lineCap = .round
        shapeNode.strokeColor = UIColor(white: 1, alpha: 0.3)
        addChild(shapeNode)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        
        
        if atPoint(location).name == "tree" {
            orange = Orange()
            orange?.position = location
            orange?.physicsBody?.isDynamic = false
            addChild(orange!)
            
            touchStart = location
            
            
            let vector = CGVector(dx: 100, dy: 0)
            orange?.physicsBody?.applyImpulse(vector)
            
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        
        orange?.position = location
        
        let path = UIBezierPath()
        path.move(to: touchStart)
        path.addLine(to: location)
        shapeNode.path = path.cgPath
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        
        
        let dx = touchStart.x - location.x
        let dy = touchStart.y - location.y
        let vector = CGVector(dx: dx, dy: dy)
        
        orange?.physicsBody?.isDynamic = true
        orange?.physicsBody?.applyImpulse(vector)
        shapeNode.path = nil
    }
    
    
    
}
