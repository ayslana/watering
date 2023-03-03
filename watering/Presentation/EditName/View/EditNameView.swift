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
    @EnvironmentObject var userPlant: UserPlant
    @State private var showingAlert = false

    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView {
            VStack {
                informations
                Text(LocalizedStringKey("l19"))

                NavigationLink(
                    destination: EditPlantView().environmentObject(userPlant)
                ){
                    PlantViewRepresentable(

                        scene: {
                            let scene = SCNScene(named: userPlant.plant.modelName)!
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
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                if controller.isSomeNameLessThan3Char() {
                    Text(LocalizedStringKey("l15"))
                        .foregroundColor(.secondary)
                } else {
                    Button(LocalizedStringKey("l15")) {
                        showingAlert = true

                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text(LocalizedStringKey("l16")),
                            message: Text(LocalizedStringKey("l17")),
                            primaryButton: .default(Text(LocalizedStringKey("l18"))) {
                                controller.saveNames()
                                userPlant.getPlant()
                                dismiss()
                            },
                            secondaryButton: .cancel()
                        )
                    }
                }
            }
        }
        .background(ThemeEnum.secondary)
    }

    var informations: some View {
        List{
            Text("Escolha seu nome: ")

            buildTextField(
                placeholder: controller.buildUserNamePlanceholder(),
                text: $controller.userName
            )

            Text("Escolha o nome de sua plantinha:")

            buildTextField(
                placeholder: controller.buildPlantNamePlaceholder(),
                text: $controller.plantName
            )
        }
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .frame(minHeight: UIScreen.main.bounds.height/3)
    }

    private func buildTextField(
        placeholder: String,
        text: Binding<String>
    ) -> some View {
        return TextField(
            placeholder,
            text: text
        )
        .foregroundColor(ThemeEnum.font)
        .listRowBackground(ThemeEnum.primary.opacity(0.2))
    }

}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditNameView()
    }
}
