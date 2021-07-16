//
//  Player.swift
//  Testes Primeiro Mini
//
//  Created by Team10 on 15/07/21.
//

import SpriteKit

class Player {
    // Propriedades
    private let player: SKSpriteNode
    private let imageName: String
    
    
    // Inicializadores
    init(imageName: String) {
        self.player = SKSpriteNode(imageNamed: imageName)
        self.imageName = imageName
        self.player.name = "player"
        self.player.physicsBody = self.intialBody()
        
    }

    
    // Metodos
  
    // MARK: - Position
    func setPosition(position: CGPoint) {
        player.position = position
    }
    
    func getPosition() -> CGPoint {
        self.player.position
    }
    
    
    
    
    // MARK: - BODY
    
    func setPhysicsBody(body: SKPhysicsBody) {
        self.player.physicsBody = body
    }
    
    func getNode() -> SKSpriteNode{
        return self.player
    }
    
    
}

// MARK:- Extensions

extension Player {
    
    // Função para adicionar o corpo fisico ao node player
    func intialBody() ->SKPhysicsBody{
        let body = SKPhysicsBody(texture: SKTexture(imageNamed: self.imageName), size: CGSize(width: player.size.width, height: player.size.height*(0.6)))//0.6
        
        body.affectedByGravity = true
        body.allowsRotation = false
        body.categoryBitMask = UInt32(mask.player.rawValue)
        body.contactTestBitMask = UInt32(mask.ground.rawValue) | UInt32(mask.enemy.rawValue)
        return body
    }
    
}
