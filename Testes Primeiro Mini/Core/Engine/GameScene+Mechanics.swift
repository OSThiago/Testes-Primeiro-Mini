//
//  GameScene+Mechanics.swift
//  Testes Primeiro Mini
//
//  Created by Vinicius Bruno on 13/07/21.
//

import SpriteKit

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
            // Olha o lado atual do player: em cima ou em baixo
            switch player.getPlayerSide() {
            case .TOP:
                jumpPlayer(heightJump: 0.22)
            case .BOTTOM:
                reversePlayer(heightPosition: 0.63)
            }

        case .down:
            print("SwipeDown")
            // Olha o lado atual do player: em cima ou em baixo
            switch player.getPlayerSide() {
            case .TOP:
                reversePlayer(heightPosition: 0.39)
            case .BOTTOM:
                jumpPlayer(heightJump: -0.22)
            }
                          
        default:
            print("No Direction")
        }
    }
    
    func reversePlayer(heightPosition: CGFloat) {
        player.getNode().physicsBody = nil
        let mover = SKAction.moveTo(y: size.height*(heightPosition), duration: 0.3)
        let colocarFisica = SKAction.run {
            self.player.setPhysicsBody(body: self.player.intialBody())
        }
        let sequencia = SKAction.sequence([mover,colocarFisica])
        player.getNode().run(sequencia)
       
        
        //player.getNode().position = CGPoint(x: size.width*(0.5), y: size.height*(heightPosition))
        player.getNode().yScale = player.getNode().yScale*(-1)
         physicsWorld.gravity.dy = physicsWorld.gravity.dy*(-1)
        changePlayerSide(atualSide: player.getPlayerSide())
        print(player.getPlayerSide())
    }
    
    func jumpPlayer(heightJump: CGFloat) {
        player.getNode().physicsBody?.applyImpulse(CGVector(dx: 0, dy: CGFloat(player.getNode().size.height*(heightJump))))
    }
    
    func changePlayerSide(atualSide: PlayerSide) {
        switch atualSide {
        case .TOP:
            player.setPlayerSide(side: .BOTTOM)
        case .BOTTOM:
            player.setPlayerSide(side: .TOP)
        }
    }
    
    
}
