//
//  GameScene+Ground.swift
//  Testes Primeiro Mini
//
//  Created by Thiago de Oliveira Sousa on 23/07/21.
//

import SpriteKit

extension GameScene{
    
    func createGround(position: CGPoint) -> SKSpriteNode{
        //criando o chao e definido as escalas e posicao
        let texture = SKTexture(imageNamed: "tilefloor1")
        
        let ground = SKSpriteNode(texture: texture)
        
        //let ground = SKSpriteNode(imageNamed: "tilefloor2")
        
         
//        ground.yScale = 0.05
//        ground.xScale = 0.21
        ground.setScale(2.5)
       // ground.size.height = CGFloat(size.width*0.15)
            //ground.xScale = frame.size.width
        ground.name = "Ground"
        ground.position = position
        
        // criando a fisica do chao
        let body = SKPhysicsBody(rectangleOf: ground.size)
        body.affectedByGravity = true
        body.allowsRotation = false
        body.isDynamic = false
        body.categoryBitMask = UInt32(mask.ground.rawValue) // atribuindo uma categoria de mascara ao chao
        body.contactTestBitMask = UInt32(mask.player.rawValue)
        ground.physicsBody = body
        
        
        
        return ground
    }

    func initialGround(time: TimeInterval) {
        
        // Criar blocos que preenche a tela ao iniciar
        for i in 0...29 {
            let initialPosition = CGPoint(x: size.width*(CGFloat(i)*0.05), y: size.height*0.5)
                //Criando o chão
                let ground = self.createGround(position: initialPosition)
                       
                //Adicionando o chão na tela
                self.addChild(ground)
                       
                //Colocando o chão para se mover
            
                start(ground: ground, speed: time)
                //self.moveGround(node: ground, time: time)
        }
    }
    
    func start(ground: SKSpriteNode, speed: TimeInterval){
            let moveLef = SKAction.moveBy(x: -frame.size.width/2, y: 0.0, duration: speed)
            let changeTile = self.changeTileGroundTexture(ground: ground)
            let reset = SKAction.moveBy(x: frame.size.width/2, y: 0.0, duration: 0.0)
            let sequence = SKAction.sequence([moveLef,changeTile,reset])
            ground.run(SKAction.repeatForever(sequence))
            
        
        }
    
    func changeTileGroundTexture(ground: SKSpriteNode) -> SKAction{
        let randomImage = Int.random(in: 1...4)
        let action = SKAction.run {
            ground.texture = SKTexture(imageNamed: "tilefloor\(randomImage)")
        }
        return action
    }
    
}
