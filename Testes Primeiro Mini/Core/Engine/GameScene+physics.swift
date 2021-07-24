//
//  GameScene+physics.swift
//  Testes Primeiro Mini
//
//  Created by Vinicius Bruno on 14/07/21.
//

import SpriteKit


enum mask: Int {
    case player = 1, ground , enemy , candy
    
}
extension GameScene: SKPhysicsContactDelegate{
    
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        // Contato entre o player e o inimigo
        if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "enemy"){
            contact.bodyA.node?.removeFromParent()
            print("you loser my brother")
        }
        if (contact.bodyA.node?.name == "enemy" && contact.bodyB.node?.name == "player"){
            contact.bodyB.node?.removeFromParent()
            //print("you loser my brother")
        }
        
        // Contato entre o player o os coletaveis
        if (contact.bodyA.node?.name == "candy" && contact.bodyB.node?.name == "player") {
            contact.bodyA.node?.removeFromParent()
            self.countCandy += 1
            self.countLabel.text = "\(self.countCandy)"
        }
        
        if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "candy") {
            contact.bodyB.node?.removeFromParent()
            self.countCandy += 1
            self.countLabel.text = "\(self.countCandy)"
        }
        
        // Contato entre 2 Inimigos
        if (contact.bodyA.node?.name == "candy" && contact.bodyB.node?.name == "enemy"){
            contact.bodyA.node?.removeFromParent()
            //print("you loser my brother")
        }
        
        if (contact.bodyA.node?.name == "enemy" && contact.bodyB.node?.name == "candy"){
            contact.bodyB.node?.removeFromParent()
            //print("you loser my brother")
        }
        
        
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
      //  print("perdeu o contato")
    }
}
