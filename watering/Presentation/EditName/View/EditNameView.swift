//
//  EditView.swift
//  Watering
//
//  Created by Narely Lima on 28/09/22.
//

import SwiftUI
import SceneKit

struct EditNameView: View {
    @StateObject var controller = EditNameController()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView {
            VStack {
                informations
                NavigationLink(destination: EditPlantView()) {
                    treeView
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                if controller.isSomeNameLessThan3Char() {
                    Text("Save")
                        .foregroundColor(.secondary)
                } else {
                    Button("Save") {
                        controller.saveNames()
                        dismiss()
                    }
                }
            }
        }
    }

    var informations: some View {
        List{
            buildTextField(
                placeholder: controller.buildUserNamePlanceholder(),
                text: $controller.userName
            )
            buildTextField(
                placeholder: controller.buildPlantNamePlaceholder(),
                text: $controller.plantName
            )
        }
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .frame(minHeight: UIScreen.main.bounds.height/3)
    }

    var treeView: some View {
        PlantViewRepresentable(
            scene: {
                let modelo = DropWaterModel(
                    id: controller.plantID,
                    type: controller.plantType,
                    modelName: controller.plantModelName
                )
                let scene = SCNScene(named: modelo.modelName)!
                scene.background.contents = UIColor.clear
                return scene
            }(),
            options: [.autoenablesDefaultLighting]
        )
        .frame(
            maxWidth: UIScreen.main.bounds.width,
            minHeight: UIScreen.main.bounds.height/2,
            alignment: .center
        )
    }

    private func buildTextField(
        placeholder: String,
        text: Binding<String>
    ) -> some View {
        return TextField(
            placeholder,
            text: text
        )
        .foregroundColor(ThemeEnum.primary)
        .listRowBackground(ThemeEnum.primary.opacity(0.2))
    }

}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditNameView()
    }
}
