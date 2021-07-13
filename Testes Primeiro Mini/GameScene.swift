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
        
        let initialPosition = CGPoint(x: size.width*(2.0) , y: size.height*0.5)
        
            let ground = createGround(position: initialPosition)
            self.addChild(ground)
            moveGround(node: ground)
        
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
    
    
    func createGround(position: CGPoint) -> SKSpriteNode{
            let ground = SKSpriteNode(imageNamed: "ground")
         
            ground.yScale = 0.05
            ground.xScale = 0.15
            //ground.xScale = frame.size.width
            ground.name = "Ground"
            ground.position = position
            return ground
    }
    
    
    func moveGround(node: SKSpriteNode) {
        let moveAction = SKAction.moveBy(x: size.width*(-3.0), y: 0, duration: 8)
        node.run(moveAction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: - Configuration

extension GameScene {
    
    func addSwipeGestureRecognizers() {
        // definindo as direções de gesto
        let gesturesDirections: [UISwipeGestureRecognizer.Direction] = [.up, .down]
        
        for gestureDirection in gesturesDirections {
            // Pegando a direcao
            let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
            // Atribuindo a direcao
            gestureRecognizer.direction = gestureDirection
            self.view?.addGestureRecognizer(gestureRecognizer)
        }
        
    }
    
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer){
        // Faz um ação de acordo com a direcao do gesto
        switch gesture.direction {
        case .up:
            print("SwipeUP")
        case .down:
            print("SwipeDown")
        default:
            print("No Direction")
        }
    }
    
}
