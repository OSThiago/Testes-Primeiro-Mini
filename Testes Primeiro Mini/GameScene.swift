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
    
    // Pripriedades Globais
   let player = Player(imageName: "Personagem_lado")
    
    var countCandy = 0
    var countLabel = SKLabelNode(fontNamed: "HelveticaNeue-CondensedBold")
    
    let cameraNode = SKCameraNode()
    
    //var ground: CCGround!
    
    
    var seconds: TimeInterval = 1
    var renderTiming: TimeInterval = 0.0

    
    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.physicsWorld.contactDelegate = self
        let initalPosition = CGPoint(x: size.width*0.5, y: size.height*0.8)
        self.addChild(player)
        
        self.countCandy = 0
        
        player.position = initalPosition
        
        parallax()
        
        initialGround(time: 1.43)
        //generateGrounds(time: 2)
       
        generatEnemys(time: 2)
        
        // Teste doce
        generateCandy(speed: 2,time: 3)
        
        
        // Teste contador
        self.countLabel.text = "\(self.countCandy)"
        self.addChild(countLabel)
        
        countLabel.fontColor = .white
        countLabel.position = CGPoint(x: size.width*0.50, y: size.height*0.80)
        
        
        // Teste camera
        addChild(cameraNode)
        camera = cameraNode
        cameraNode.position = CGPoint(x: size.width/2, y: size.height*0.85)
        
        
        let bounds = self.calculateAccumulatedFrame().height/2
        let diference: CGFloat = 400
        
        let cameraConstraints = SKConstraint.positionY(.init(lowerLimit: -bounds+diference, upperLimit: bounds))
        
        self.cameraNode.constraints = [cameraConstraints]
        
        
       
        
        
        
        
    }
    
    
    
    // Esse método é chamado automaticamente após a cena ser criada (DEPOIS do método init(:size))
    override func didMove(to view: SKView) {
        
        // Funcao para indetificar a a direção do SWipe
        addSwipeGestureRecognizers()
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        let playerXPosition = size.width/2
        
        if player.position.x != playerXPosition {
            player.position.x = playerXPosition
        }
        
        
        // Colocando movimentacao na camera para seguir o player com um delay
        switch player.getPlayerSide() {
        case .TOP:
            //cameraNode.position = CGPoint(x: player.getNode().position.x, y: player.getNode().position.y*1.35)
            self.cameraNode.run(.moveTo(y: player.position.y*1.35, duration: 0.15))
        case .BOTTOM:
            //cameraNode.position = CGPoint(x: player.getNode().position.x, y: player.getNode().position.y*0.35)
            self.cameraNode.run(.moveTo(y: player.position.y*0.35, duration: 0.15))
        }
        
        
        
        
        if currentTime > renderTiming{
            if renderTiming > 0{
                seconds -= 0.01
            }
            renderTiming = currentTime+1
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
