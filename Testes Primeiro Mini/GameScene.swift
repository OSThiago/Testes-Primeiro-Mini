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
    
    //let personagem = SKSpriteNode(imageNamed: "Personagem_lado")
    
    let player = Player(imageName: "Personagem_lado")
    
    

    override init(size: CGSize) {
        super.init(size: size)
        
        self.physicsWorld.contactDelegate = self
        
       
        let initalPosition = CGPoint(x: size.width*0.5, y: size.height*0.8)
        
        self.addChild(player.getNode())
        
        player.setPosition(position: initalPosition)
         
        parallax()
        
        generateGrounds(time: 2)
        generatEnemys(time: 2)
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


