//
//  GameScene+physics.swift
//  Testes Primeiro Mini
//
//  Created by Vinicius Bruno on 14/07/21.
//

import SpriteKit


enum mask: Int {
    case player = 1, ground , enemy 
    
}
extension GameScene: SKPhysicsContactDelegate{
    
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "enemy"){
            contact.bodyA.node?.removeFromParent()
            print("you loser my brother")
        }
        if (contact.bodyA.node?.name == "enemy" && contact.bodyB.node?.name == "player"){
            contact.bodyB.node?.removeFromParent()
            print("you loser my brother")
        }
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
      //  print("perdeu o contato")
    }
}
