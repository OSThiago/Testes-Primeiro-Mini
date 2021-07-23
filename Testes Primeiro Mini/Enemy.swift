//
//  Enemy.swift
//  Testes Primeiro Mini
//
//  Created by Thiago de Oliveira Sousa on 21/07/21.
//

import SpriteKit

class Enemy: SKSpriteNode {
    
    var imageNamed: String
    
    init(image: String, position: CGPoint) {
        self.imageNamed = image
        let texture = SKTexture(imageNamed: imageNamed)
        
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        
        self.setScale(2.0)
        self.position = position
        self.zPosition = 1
        self.name = "enemy"
        self.physicsBody = createEnemyBody(imageNamed: image)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension Enemy {
    
    private func createEnemyBody(imageNamed: String) -> SKPhysicsBody{
        let body = SKPhysicsBody(texture: SKTexture(imageNamed: imageNamed), size: self.size)
        body.affectedByGravity = true
        body.allowsRotation = false
        body.isDynamic = false
        body.categoryBitMask = UInt32(mask.enemy.rawValue)
        body.contactTestBitMask = UInt32(mask.player.rawValue)
        return body
    }
    
    
}
