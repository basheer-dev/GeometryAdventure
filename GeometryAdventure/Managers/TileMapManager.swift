//
//  TileMapManager.swift
//  GeometryAdventure
//
//  Created by Basheer Abdulmalik on 25/01/2024.
//

import Foundation

final class TileMapManager {
    
    static let shared = TileMapManager()
    
    public func getTileMap(fileNamed name: String) -> [[Int]] {
        var tileMap = [[Int]]()
        
        guard let url = Bundle.main.url(forResource: name, withExtension: "csv"),
              let mapString = try? String(contentsOf: url).components(separatedBy: "\n") else { return tileMap }
        
        
        for (id, row) in mapString.enumerated() {
            tileMap.append([])
            
            for item in row.components(separatedBy: ",") {
                if let item = Int(item) { tileMap[id].append(item) }
            }
        }
        
        return tileMap
    }
}
