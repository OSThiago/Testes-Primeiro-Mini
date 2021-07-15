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
        print("teve contato")
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        print("perdeu o contato")
    }
}
