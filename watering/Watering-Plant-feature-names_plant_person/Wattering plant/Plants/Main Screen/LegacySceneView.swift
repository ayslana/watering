//
//  LegacySceneView.swift
//  Wattering plant
//
//  Created by Narely Lima on 14/09/22.
//

import Foundation
import SceneKit
import SwiftUI

struct LegacySceneView: UIViewRepresentable {
    var scene: SCNScene
    var options: SceneView.Options

    func makeUIView(context: Context) -> SCNView {
        let view = SCNView()
        view.backgroundColor = UIColor.clear
        view.autoenablesDefaultLighting = options.contains(.autoenablesDefaultLighting)
        view.rendersContinuously = options.contains(.rendersContinuously)
        view.isJitteringEnabled = options.contains(.jitteringEnabled)
        view.isTemporalAntialiasingEnabled = options.contains(.temporalAntialiasingEnabled)
        view.scene = scene
        return view
    }

    func updateUIView(_ uiView: SCNView, context: Context) { }
}
