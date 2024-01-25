//
//  Player.swift
//  GeometryAdventure
//
//  Created by Basheer Abdulmalik on 25/01/2024.
//

import SpriteKit

final class Player: SKShapeNode {
    
    override init() {
        super.init()
        
        setUp()
    }
    
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    private func setUp() {
        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 32, height: 64))
        physicsBody?.restitution = 0
//        fillColor = .red
    }
    
    
    func draw(in scene: SKScene, position: CGPoint) {
        self.position = position
        scene.addChild(self)
    }
}
