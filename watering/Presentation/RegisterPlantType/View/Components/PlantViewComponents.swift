//
//  PlantViewComponents.swift
//  Watering
//
//  Created by Robson Lima Lopes on 10/02/23.
//

import SwiftUI
import SceneKit

struct PlantViewComponents {
    func plantViewConstructor(
        plant: DropWaterModel,
        onTap: @escaping () -> Void = {},
        isBigPlant: Bool = false
    ) -> some View{
        return PlantViewRepresentable(scene: {
            sceneConstructor(plant: plant)
        }(),
        options: [.autoenablesDefaultLighting])
        .frame(
            minWidth: UIScreen.main.bounds.width / (isBigPlant ? 0.8 : 1.5),
            minHeight: UIScreen.main.bounds.height / (isBigPlant ? 1.6 : 3.5),
            alignment: .center
        )
        .cornerRadius(15)
        .onTapGesture {
            withAnimation(.easeOut){
                onTap()
            }
        }

    }

    private func sceneConstructor(plant: DropWaterModel) -> SCNScene{

        let scene = SCNScene(named: plant.modelName)!
        scene.background.contents = UIColor.clear

        scene.rootNode.childNodes.forEach { node in

            let rotate = SCNAction.rotate(
                by: CGFloat(GLKMathDegreesToRadians(30)),
                around: SCNVector3(x: 0, y: 0, z: 0),
                duration: 1
            )
            let loop = SCNAction.repeatForever(rotate)
            node.runAction(loop)

            scene.rootNode.addChildNode(node)
        }

        return scene
    }
}
