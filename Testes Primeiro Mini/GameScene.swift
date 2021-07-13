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
        
        generateGrounds(time: 2)

        //let initialPosition = CGPoint(x: size.width*(2.0) , y: size.height*0.5)
        
        
//            let ground2 = createGround(position: CGPoint(x: size.width*(1.5) , y: size.height*0.5))
//            self.addChild(ground2)
//            //moveGround(node: ground2)
//
//            let ground3 = createGround(position: CGPoint(x: size.width*(2.5) , y: size.height*0.5))
//            self.addChild(ground3)
//           // moveGround(node: ground3)
//
    }
    //oi
    
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


