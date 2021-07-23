//
//  CCGround.swift
//  Testes Primeiro Mini
//
//  Created by Thiago de Oliveira Sousa on 22/07/21.
//

import SpriteKit

class CCGround: SKSpriteNode {
    
    init(size: CGSize) {
        let texture = SKTexture(imageNamed: "tilecemiterio")
        
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        
        //let groundTeste = SKSpriteNode(imageNamed: "tilecemiterio")
        self.setScale(2.5)
        self.name = "Ground"
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start() {
        let moveLeft = SKAction.moveBy(x: size.width*(-18), y: 0, duration: 1.0)
        self.run(moveLeft)
    }
    
    
}
