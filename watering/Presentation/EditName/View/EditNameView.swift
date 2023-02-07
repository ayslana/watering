//
//  EditView.swift
//  Watering
//
//  Created by Narely Lima on 28/09/22.
//

import SwiftUI
import SceneKit

struct EditNameView: View {
    @State var personName: String = "\(UserDefaults.standard.getPersonName() ?? "Unset")"
    @State var plantName: String = "\(UserDefaults.standard.getPlantName() ?? "Unset")"
    var body: some View {
        VStack {
            informations
            NavigationLink(destination: EditPlantView()) {
                treeView
                    .frame(height: UIScreen.main.bounds.height/2)
            }
            .position(x: 200, y: -10)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: WateringView().navigationBarBackButtonHidden(), label: { save })
                    .transition(.move(edge: .trailing))
                    .simultaneousGesture(TapGesture().onEnded{
                        saveName()
                        savePlantName()
                    })
            }
        }
    }
    var informations: some View {
        List{
            TextField("\(UserDefaults.standard.getPersonName() ?? "Unset")", text: $personName)
                .foregroundColor(ThemeEnum.primary)
                .listRowBackground(ThemeEnum.primary.opacity(0.2))
            TextField("\(UserDefaults.standard.getPlantName() ?? "Unset")", text: $plantName)
                .foregroundColor(ThemeEnum.primary)
                .listRowBackground(ThemeEnum.primary.opacity(0.2))
        }
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
    }
    var save: some View {
        Text("Save")
            .foregroundColor(ThemeEnum.primary)
    }
    var treeView: some View {
        //INSERÇÃO DO MODELO 3D
        PlantViewRepresentable(scene: {
            let modelo = DropWaterModel(id: UserDefaults.standard.getPlantID() ?? 0, type: UserDefaults.standard.getPlantTypeName() ?? "", modelName: UserDefaults.standard.getPlantType() ?? "")
            let scene = SCNScene(named: modelo.modelName)!
            scene.background.contents = UIColor.clear
            return scene
        }(),
                  options: [.autoenablesDefaultLighting, .allowsCameraControl])
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2, alignment: .center)
    }
    func saveName() {
        UserDefaults.standard.setPersonName(value: personName)
    }
    func savePlantName() {
        UserDefaults.standard.setPlantName(value: plantName)
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditNameView()
    }
}
