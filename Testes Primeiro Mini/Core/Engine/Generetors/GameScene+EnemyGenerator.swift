//
//  GameScene+EnemyGenerator.swift
//  Testes Primeiro Mini
//
//  Created by Vinicius Bruno on 14/07/21.
//

import SpriteKit


extension GameScene{
    
    func generatEnemys(time: TimeInterval){
        
        //var timeTeste = time
        
        let creatEnemy = SKAction.run {
            
            
            let qualquerCoisaAi = self.randomPosition()
            let initialPosition = CGPoint(x: self.size.width*1.5, y: self.size.height*(qualquerCoisaAi))
            let random = Int.random(in: 1...4)
            
            let enemy = Enemy(image: "obstacle\(random)", position: initialPosition)
            //let enemy = self.creatEnemy(position: initialPosition)
            if qualquerCoisaAi < 0.63{
                enemy.xScale = enemy.xScale*(-1)
                enemy.yScale = enemy.yScale*(-1)
            }
            
            self.addChild(enemy)
            self.moveEnemy(node: enemy, time: time)
            
        }
        
        let waitInBetween = SKAction.wait(forDuration: time)
        let sequence = SKAction.sequence([creatEnemy,waitInBetween])
        let repeatForever = SKAction.repeatForever(sequence)
        self.run(repeatForever)
    }
    
    func randomPosition()->CGFloat{
        let random = Int.random(in: 1...3)
        print(random)
        switch random {
        case 1:
            return 0.39
        case 2:
            return 0.63
        default:
            return 0.63
        }
    }
    
    
    func moveEnemy(node: SKSpriteNode, time: TimeInterval){
        let multiplier = 4.0
        let moveAction = SKAction.moveBy(x: size.width*(-2.8), y: 0, duration: time*multiplier)
        
        let remove = SKAction.removeFromParent()
        let sequence = SKAction.sequence([moveAction,remove])
        node.run(sequence)
    }
}
