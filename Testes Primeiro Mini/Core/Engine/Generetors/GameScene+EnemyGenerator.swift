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
        enemy.zPosition = 1
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
//        let escolha: [CGFloat] = [0.36,0.63]
//        let valor: CGFloat = escolha.randomElement()!
//
//        var qualquerCoisaAi = self.randomPosition()
//        let initialPosition = CGPoint(x: size.width*1.5, y: size.height*(qualquerCoisaAi))
        
        let creatEnemy = SKAction.run {
            let qualquerCoisaAi = self.randomPosition()
            let initialPosition = CGPoint(x: self.size.width*1.5, y: self.size.height*(qualquerCoisaAi))
            
            let _enemy = self.creatEnemy(position: initialPosition)
            if qualquerCoisaAi < 0.63{
                _enemy.xScale = _enemy.xScale*(-1)
                _enemy.yScale = _enemy.yScale*(-1)
            }
//            let enemyInvert = self.creatEnemy(position: initialPosition2)
//            enemyInvert.xScale = enemyInvert.xScale*(-1)
//            enemyInvert.yScale = enemyInvert.yScale*(-1)
//            self.addChild(enemyInvert)
            self.addChild(_enemy)
            self.moveEnemy(node: _enemy, time: time)
            //self.moveEnemy(node: enemyInvert, time: time)
        }
        
        let waitInBetween = SKAction.wait(forDuration: time)
        let sequence = SKAction.sequence([creatEnemy,waitInBetween])
        let repeatForever = SKAction.repeatForever(sequence)
        self.run(repeatForever)
    }
    
    func randomPosition()->CGFloat{
        let random = Int.random(in: 1...3)
        print(random)
        switch random {
        case 1:
            return 0.35
        case 2:
            return 0.63
        default:
            return 0.63
        }
    }
    
    
    func moveEnemy(node: SKSpriteNode, time: TimeInterval){
        let multiplier = 4.0
        let moveAction = SKAction.moveBy(x: size.width*(-2.8), y: 0, duration: time*multiplier)
        
        let remove = SKAction.removeFromParent()
        let sequence = SKAction.sequence([moveAction,remove])
        node.run(sequence)
    }
}
