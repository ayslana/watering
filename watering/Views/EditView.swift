//
//  EditView.swift
//  Watering
//
//  Created by Narely Lima on 28/09/22.
//

import SwiftUI
import SceneKit


struct EditView: View {
    @State var personName: String = "\(UserDefaults.standard.getPersonName() ?? "Unset")"
    @State var plantName: String = "\(UserDefaults.standard.getPlantName() ?? "Unset")"
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ChangePlantView().navigationBarBackButtonHidden()) {
                    treeView
                        .offset(y: -100)
                        .frame(height: UIScreen.main.bounds.height/1.7)
                }
                informations
                NavigationLink (
                    destination : WateringView().navigationBarBackButtonHidden(),
                    label : {
                        save
                    })
                .transition(.move(edge: .trailing))
                .simultaneousGesture(TapGesture().onEnded{
                    saveName()
                    savePlantName()
                })
            }
        }.navigationBarBackButtonHidden()
    }
    
    var informations: some View {
        List {
            Section(header: Text("Informations")) {
                TextField("\(UserDefaults.standard.getPersonName() ?? "Unset")", text: $personName)
                TextField("\(UserDefaults.standard.getPlantName() ?? "Unset")", text: $plantName)
            }
            .foregroundColor(Theme.primary)
            .headerProminence(.increased)
        }
    }
    var save: some View {
        Text ("Salvar")
            .foregroundColor(Theme.primary)
            .frame(width: 200, height: 50)
            .font(.system(size: 20, design: .rounded))
            .overlay(RoundedRectangle(cornerRadius: 15)
                .stroke(Theme.primary, lineWidth: 2))
            .padding()
                }
    var treeView: some View {
        //INSERÇÃO DO MODELO 3D
        PlantView(scene: {
            let modelo = DropWaterModel(id: UserDefaults.standard.getPlantID() ?? 0, type: UserDefaults.standard.getPlantTypeName() ?? "", modelName: UserDefaults.standard.getPlantType() ?? "")
            let scene = SCNScene(named: modelo.modelName)!
            scene.background.contents = UIColor.clear
            return scene
        }(),
                  options: [.autoenablesDefaultLighting, .allowsCameraControl])
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.4 , alignment: .center)
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
        EditView()
    }
}
