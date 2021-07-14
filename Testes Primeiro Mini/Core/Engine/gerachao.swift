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
        ground.xScale = 0.21
            //ground.xScale = frame.size.width
        ground.name = "Ground"
        ground.position = position
        
        // criando a fisica do chao
        let body = SKPhysicsBody(rectangleOf: ground.size)
        body.affectedByGravity = true
        body.allowsRotation = false
        body.isDynamic = false
        body.categoryBitMask = UInt32(mask.ground.rawValue) // atribuindo uma categoria de mascara ao chao
        ground.physicsBody = body
        
        
        
        return ground
    }
    
    
    
    func generateGrounds(time: TimeInterval) {
        let initialPosition = CGPoint(x: size.width*1.5, y: size.height*0.5)
        let creatGround = SKAction.run {
            let _ground = self.createGround(position: initialPosition)
            self.addChild(_ground)
            self.moveGround(node: _ground, time: time)
        }
        
        
        let waitInBetween = SKAction.wait(forDuration: time)
        let sequence = SKAction.sequence([creatGround,waitInBetween])
        let repeatForever = SKAction.repeatForever(sequence)
        self.run(repeatForever)
    }
    
    func moveGround(node: SKSpriteNode, time: TimeInterval) {
        
        let multiplier = 4.0
        let moveAction = SKAction.moveBy(x: size.width*(-2.8), y: 0, duration: time*multiplier)
        
        let remover = SKAction.removeFromParent()
        let sequencia = SKAction.sequence([moveAction,remover])
        node.run(sequencia)
    }
    
    func initialGround(time: TimeInterval) {
        // Posição inicila no centro da tela
        let initialPosition = CGPoint(x: size.width*0.48, y: size.height*0.5)
               
            //Criando o chão
            let ground = self.createGround(position: initialPosition)
                   
            //Adicionando o chão na tela
            self.addChild(ground)
                   
            //Colocando o chão para se mover
            self.moveGround(node: ground, time: time)
    }
    
    
}
