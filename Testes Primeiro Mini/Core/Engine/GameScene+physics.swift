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
        //comeco de um contato
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        // fim de um contato
    }
}
