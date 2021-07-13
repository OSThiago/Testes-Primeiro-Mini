//
//  Ground.swift
//  Testes Primeiro Mini
//
//  Created by Thiago de Oliveira Sousa on 13/07/21.
//

import SpriteKit

class Ground: SKSpriteNode {
    
    init(position: CGPoint){
        let texture = SKTexture(imageNamed: "ground")
        super.init(texture: texture, color: .clear, size: texture.size())
        
        self.position = position
        self.setScale(0.12)
        self.yScale = 0.05
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configuration

extension Ground {
    
    func setupGround(_ scene: SKScene) {
        for i in 0...2 {
            let ground = Ground(position: CGPoint(x: size.width*0.50, y: size.height*0.50))
            ground.position = CGPoint(x: CGFloat(i)*ground.frame.size.width, y: scene.frame.size.height/2)
            addChild(ground)
        }
    }
    
}
