//
//  PlantModalView.swift
//  Watering
//
//  Created by Robson Lima Lopes on 17/02/23.
//

import SwiftUI
import SceneKit

struct PlantModalView: View {
    @EnvironmentObject var controller: EditPlantController
    @Namespace var namespace
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Text("string_args_0023")
                .font(.title3)
                .multilineTextAlignment(.center)
                .lineLimit(nil)

            Text(LocalizedStringKey(controller.selected.type))
                .font(.title3)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            PlantViewRepresentable(
                scene: {
                    let scene = SCNScene(named: controller.selected.modelName)!
                    scene.background.contents = UIColor.clear
                    return scene
                }(),
                options: [.autoenablesDefaultLighting, .allowsCameraControl])
            .frame(
                maxWidth: UIScreen.main.bounds.width/0.8,
                maxHeight: UIScreen.main.bounds.height / 2,
                alignment: .center
            )
            .matchedGeometryEffect(id: controller.selected.id, in: namespace)
        }
        .toolbar {
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.body)
                    .foregroundColor(.accentColor)
            }
        }
    }
}

struct PlantModalView_Previews: PreviewProvider {
    static var previews: some View {
        PlantModalView()
    }
}
