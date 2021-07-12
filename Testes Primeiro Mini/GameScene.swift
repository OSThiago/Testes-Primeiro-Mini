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
    
    // Variaveis globais
    
    var player: SKSpriteNode?
    // Primeiro método a ser chamado sempre que a cena for iniciada
    override init(size: CGSize) {
        super.init(size: size)
        
        // -------------------------
        // Escrever o código aqui
        // Primeira alteracao !!!!!!!!!!!!
        // Altera ai meu
        // -------------------------
        
        /*
         
         //amo a internet
         XIMBALAUÊ
         
         */
        
        // Adicionado um background
        self.createBackground(with: CGPoint(x: size.width*0.50, y: size.height*0.50))

        self.createGround(with: CGPoint(x: size.width*0.40, y: size.height*0.30))
        
        self.player =  cratePlayer(with: CGPoint(x: size.width*0.50, y: size.height*0.50))
        self.addChild(player!)
    }
    
    // Esse método é chamado automaticamente após a cena ser criada (DEPOIS do método init(:size))
    override func didMove(to view: SKView) {
        
        // Funcao para indetificar a a direção do SWipe
        addSwipeGestureRecognizers()
    }
    
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
            // Aplicando um impulso ao node player (fazer ele pular)
            player?.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: (player?.size.height)! * 0.5))
        case .down:            
            print("SwipeDown")
        default:
            print("No Direction")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // Adicionando evento de impulso(pulo)
        // No caso ele vai pular com a referencia do tamnho do proprio node
       // player?.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: (player?.size.height)! * 0.5))
        
    }
    
    
    /**
     Chamado até 60 por segundo
     */
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    
    // Criando um background para a cena
    func createBackground(with position: CGPoint) {
        // Definindo uma cor para o background
        let backgroundColor = UIColor.cyan

        // Definindo uma tamnho para node, no caso está pegando o mesmo tamanho da scene
        let backgroundSize = CGSize(width: size.width, height: size.height)

        // Criando o node com SKSpriteNode(aceita imagans e cor solida)
        let background = SKSpriteNode(color: backgroundColor, size: backgroundSize)

        // Alterando a posicao para a que foi passada na declaracao
        background.position = position

        background.zPosition = -1

        // adicionando o background à cena
        self.addChild(background)
    }
    
    func createGround(with position: CGPoint){
        
        // Criando um chão do tipo SKSpriteNode (imagem ou cor solida)
        let ground = SKSpriteNode(color: .brown, size: .init(width: 200, height: 50))
        
        // Definindo a posicao
        ground.position = position
        
        // Criando um corpo fisico do tamanho do chão
        let body = SKPhysicsBody(rectangleOf: ground.size)
        
        // Alterando as propriedades do corpo fisico
        body.affectedByGravity = true
        body.allowsRotation = false
        // Deixar o node estatico (tira a dinamica do node)
        body.isDynamic = false
        
        // Aplicando o corpo fisico ao chão
        ground.physicsBody = body
        
        self.addChild(ground)
    }
    
    
    func cratePlayer(with position: CGPoint) -> SKSpriteNode{
        
        // Criando um node a partir de uma imagem
        let player = SKSpriteNode(imageNamed: "thithi")
        
        // Definindo a posicao
        player.position = position
        
        // crinado um corpo para adicionar fisica ao node
        let body = SKPhysicsBody(rectangleOf: player.size )
        body.affectedByGravity = true
        body.allowsRotation = false
        
        // Atribuindo a fisica ao node
        player.physicsBody = body
        
        
        return player
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
