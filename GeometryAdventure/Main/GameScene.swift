//
//  GameScene.swift
//  GeometryAdventure
//
//  Created by Basheer Abdulmalik on 25/01/2024.
//

import SpriteKit

class GameScene: SKScene {
    
    let map = TileMapManager.shared.getTileMap(fileNamed: "tilemap")
    
    override func didMove(to view: SKView) {
        
    }
}
