//
//  RainLightningScene.swift
//  Wattering plant
//
//  Created by Narely Lima on 19/09/22.
//

import Foundation
import SpriteKit

class RainLightningScene: SKScene {

    static var shared = RainLightningScene()

    let rainEmitter = SKEmitterNode(fileNamed: "RainDrops.sks")!

    override func didMove(to view: SKView) {
        self.backgroundColor = .clear
        self.addChild(rainEmitter)

        rainEmitter.position.y = self.frame.maxY
        rainEmitter.particlePositionRange.dx = self.frame.width * 2.5
    }
}

