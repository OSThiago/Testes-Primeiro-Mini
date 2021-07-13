//
//  gerachao.swift
//  Testes Primeiro Mini
//
//  Created by Vinicius Bruno on 13/07/21.
//

import SpriteKit

extension GameScene{
    
    func createGround(position: CGPoint) -> SKSpriteNode{
        //criando o chao e definido as escalas e posicao
        let ground = SKSpriteNode(imageNamed: "ground")
         
        ground.yScale = 0.05
        ground.xScale = 0.15
            //ground.xScale = frame.size.width
        ground.name = "Ground"
        ground.position = position
        
        // criando a fisica do chao
        let body = SKPhysicsBody(rectangleOf: ground.size)
        body.affectedByGravity = true
        body.allowsRotation = false
        body.isDynamic = false
        ground.physicsBody = body
        
        
        
        return ground
    }
    
    
    func generateGrounds(time: TimeInterval)  {
        let initialPosition = CGPoint(x: size.width*2, y: size.height*0.5)
        let creatGround = SKAction.run {
            let _ground = self.createGround(position: initialPosition)
            self.addChild(_ground)
            self.moveGround(node: _ground)
        }
        
        
        let waitInBetween = SKAction.wait(forDuration: time)
        let sequence = SKAction.sequence([creatGround,waitInBetween])
        let repeatForever = SKAction.repeatForever(sequence)
        self.run(repeatForever)
    }
    
    
    
    func moveGround(node: SKSpriteNode) {
        let moveAction = SKAction.moveBy(x: size.width*(-2.8), y: 0, duration: 8)
        
        
        
        let remover = SKAction.removeFromParent()
        let sequencia = SKAction.sequence([moveAction,remover])
        node.run(sequencia)
//        let a = SKAction.move(to: CGPoint.init(x: position.x, y: 0), duration: 1.5)
//        let p = SKAction.removeFromParent()
//        node.run(.sequence([a,p]))
    }
    
}
