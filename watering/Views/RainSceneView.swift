//
//  RainSceneView.swift
//  watering
//
//  Created by Ayslana Riene on 20/09/22.
//

import Foundation
import SpriteKit

class RainSceneView: SKScene {

    static var shared = RainSceneView()

    let rainEmitter = SKEmitterNode(fileNamed: "RainDrops.sks")!

    override func didMove(to view: SKView) {
        self.backgroundColor = .clear
        if !rainEmitter.inParentHierarchy(self) {
            self.addChild(rainEmitter)
        }
        rainEmitter.position.y = self.frame.maxY
        rainEmitter.particlePositionRange.dx = self.frame.width * 2.5
    }
}
