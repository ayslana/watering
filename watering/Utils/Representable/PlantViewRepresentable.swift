//
//  PlantView.swift
//  watering
//
//  Created by Ayslana Riene on 20/09/22.
//

import Foundation
import SceneKit
import SwiftUI

struct PlantViewRepresentable: UIViewRepresentable {
    var scene: SCNScene
    var options: SceneView.Options

    func makeUIView(context: Context) -> SCNView {
        let view = SCNView()
        view.backgroundColor = UIColor.clear
        view.allowsCameraControl = options.contains(.allowsCameraControl)
        view.autoenablesDefaultLighting = options.contains(.autoenablesDefaultLighting)
        view.rendersContinuously = options.contains(.rendersContinuously)
        view.isJitteringEnabled = options.contains(.jitteringEnabled)
        
        view.isTemporalAntialiasingEnabled = options.contains(.temporalAntialiasingEnabled)
        view.scene = scene

        return view
    }

    func updateUIView(_ uiView: SCNView, context: Context) {
        uiView.scene = scene
    }
}
