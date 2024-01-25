//
//  GameScene.swift
//  GeometryAdventure
//
//  Created by Basheer Abdulmalik on 25/01/2024.
//

import SpriteKit

class GameScene: SKScene {
    
    private let tileMap = TileMapManager.shared.getTileMap(fileNamed: "tilemap2")
    private let player = Player(rectOf: CGSize(width: 32, height: 64))
    private let cameraNode = SKCameraNode()
    
    override func didMove(to view: SKView) {
        player.draw(in: self, position: CGPoint(x: frame.width / 2, y: frame.height / 2))
        camera = cameraNode
        
        addChild(cameraNode)
        
        for (rowID, row) in tileMap.enumerated() {
            for (columnID, column) in row.enumerated() {
                if column == 0 {
                    let terrain = SKShapeNode(rectOf: CGSize(width: 32, height: 32))
                    terrain.physicsBody = SKPhysicsBody(rectangleOf: terrain.frame.size)
                    terrain.physicsBody?.isDynamic = false
                    terrain.fillColor = .red
                    terrain.strokeColor = .red
                    
                    terrain.position = CGPoint(x: columnID * 32,
                                               y: -rowID * 32)
                    print(rowID * 32)
                    
                    addChild(terrain)
                }
            }
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        cameraNode.position = player.position
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        let node = SKShapeNode(circleOfRadius: 20)
        node.fillColor = .red
        node.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        node.position = location
        addChild(node)
    }
}
