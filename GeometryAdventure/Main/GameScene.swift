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
    private let tileMapSurface = SKNode()
    private let cameraNode = SKCameraNode()
    private var terrains: [SKShapeNode] = []
    
    override func didMove(to view: SKView) {
//        let activeMap = Array(map.prefix(30)).map { $0.prefix(40) }
//        let activeMap = map[1...2].map { $0[3...5] }
//        player.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 32, height: 64))
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
//        removeChildren(in: terrains)
//        terrains.removeAll(keepingCapacity: true)
        
        cameraNode.position = player.position
        
//        let centerRowID = abs(Int((player.position.y - frame.height) / 32))
//        let centerColumnID = abs(Int(player.position.x / 32))
//        
//        let startingRowID = centerRowID - 15 > 0 ? centerRowID - 15 : 0
//        let endingRowID = centerRowID + 15 < tileMap.count - 1 ? centerRowID + 15 : tileMap.count - 1
//        
//        let startingColumnID = centerColumnID - 20 > 0 ? centerColumnID - 20 : 0
//        let endingColumnID = centerColumnID + 20 < tileMap[0].count - 1 ? centerColumnID + 20 : tileMap[0].count - 1
//        
//        if startingRowID < endingRowID - 1 && startingColumnID < endingColumnID - 1 {
//            let activeMap = tileMap[startingRowID...endingRowID - 1].map { $0[startingColumnID...endingColumnID - 1] }
//            print("\(startingRowID) | \(endingRowID)")
//            
//            for (rowID, row) in activeMap.enumerated() {
//                for (columnID, column) in row.enumerated() {
//                    if column == 0 {
//                        let terrain = SKShapeNode(rectOf: CGSize(width: 32, height: 32))
//                        terrain.physicsBody = SKPhysicsBody(rectangleOf: terrain.frame.size)
//                        terrain.physicsBody?.isDynamic = false
//                        terrain.fillColor = .red
//                        terrain.strokeColor = .red
//                        
//                        terrain.position = CGPoint(x: (startingColumnID + columnID) * 32,
//                                                   y: (startingRowID + rowID) * 32)
//                        terrains.append(terrain)
//                        addChild(terrain)
//                    }
//                }
//            }
//        }
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
