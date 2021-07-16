//
//  GameScene+Mechanics.swift
//  Testes Primeiro Mini
//
//  Created by Vinicius Bruno on 13/07/21.
//

import SpriteKit

extension GameScene{
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
            if ( player.getNode().yScale < 0){
                
                reversePlayer(heightPosition: 0.63)

            }else{
                player.getNode().physicsBody?.applyImpulse(CGVector(dx: 0, dy: CGFloat(player.getNode().size.height*0.22)))
            }
            
        case .down:
            print("SwipeDown")
            if ( player.getNode().yScale > 0){
                
                reversePlayer(heightPosition: 0.39)
                
            }else{
                player.getNode().physicsBody?.applyImpulse(CGVector(dx: 0, dy: CGFloat(player.getNode().size.height*(-0.22))))
            }
        default:
            print("No Direction")
        }
    }
    
    
    func reversePlayer(heightPosition: CGFloat) {
        player.getNode().position = CGPoint(x: size.width*(0.5), y: size.height*(heightPosition))
        player.getNode().yScale = player.getNode().yScale*(-1)
         physicsWorld.gravity.dy = physicsWorld.gravity.dy*(-1)
    }
    
}
