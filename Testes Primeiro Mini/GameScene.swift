//
//  GameScene.swift
//  Testes Primeiro Mini
//
//  Created by Thiago de Oliveira Sousa on 08/07/21.
//

// Frameworks importantes para o funcionamento
import SpriteKit
import GameplayKit


// A GameScene é criado na GameViewControl
class GameScene: SKScene {
    // mudanca para teste commit
    override init(size: CGSize) {
        super.init(size: size)
        
        
        let initialPosition = CGPoint(x: size.width*0.50, y: size.height*0.50)
        
        let background = createBackGround(imageName: "plx-1", position: initialPosition, deph: -4)
        
        self.addChild(background)
        
        
//MARK:- TESTE MOVEMENTACAO BACKGROUND
        parallax()
        
        generateGrounds(time: 2)
        initialGround(time: 2)

    }
    
    // Esse método é chamado automaticamente após a cena ser criada (DEPOIS do método init(:size))
    override func didMove(to view: SKView) {
        
        
        // Funcao para indetificar a a direção do SWipe
        addSwipeGestureRecognizers()
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
    }
    
    
  
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: - Configuration


