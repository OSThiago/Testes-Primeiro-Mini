//
//  GameScene+EnemyGenerator.swift
//  Testes Primeiro Mini
//
//  Created by Vinicius Bruno on 14/07/21.
//

import SpriteKit


extension GameScene{
    func creatEnemy(position: CGPoint) -> SKSpriteNode {
        let enemy = SKSpriteNode(imageNamed: "fantasma1")
        enemy.setScale(0.8)
        enemy.position = position
        enemy.name = "enemy"
        let body = SKPhysicsBody(texture: SKTexture(imageNamed: "fantasma1"), size: enemy.size)
        body.affectedByGravity = true
        body.allowsRotation = false
        body.isDynamic = false
        body.categoryBitMask = UInt32(mask.enemy.rawValue)
        body.contactTestBitMask = UInt32(mask.player.rawValue)
        enemy.physicsBody = body
        
        return enemy
    }
    
    
    func generatEnemys(time: TimeInterval){
        let initialPosition = CGPoint(x: size.width*1.5, y: size.height*0.63)
        let creatEnemy = SKAction.run {
            let _enemy = self.creatEnemy(position: initialPosition)
            self.addChild(_enemy)
            self.moveEnemy(node: _enemy, time: time)
        }
        
        let waitInBetween = SKAction.wait(forDuration: time)
        let sequence = SKAction.sequence([creatEnemy,waitInBetween])
        let repeatForever = SKAction.repeatForever(sequence)
        self.run(repeatForever)
    }
    
    
    func moveEnemy(node: SKSpriteNode, time: TimeInterval){
        let multiplier = 4.0
        let moveAction = SKAction.moveBy(x: size.width*(-2.8), y: 0, duration: time*multiplier)
        
        let remove = SKAction.removeFromParent()
        let sequence = SKAction.sequence([moveAction,remove])
        node.run(sequence)
    }
}
