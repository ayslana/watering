//
//  DropWaterModel.swift
//  watering
//
//  Created by Ayslana Riene on 20/09/22.
//

import SwiftUI

// É a struct que contem o modelo para conseguir categorizar nossos modelos 3D
// Por ser parecido com um dicionario, nós conseguimos trabalhar com os itens
// de mais simplificada
struct DropWaterModel : Identifiable {
    var id: Int
    var type: String
    var modelName: String
//    var timeWatering: Int
}

var PlantsType = [
    DropWaterModel(id: 0, type: "Flower", modelName: "flower.scn"),
    DropWaterModel(id: 1, type: "Succulent", modelName: "succullent.scn"),
    DropWaterModel(id: 2, type: "Fruit Tree", modelName: "plants.scn"),
    DropWaterModel(id: 3, type: "Cactus", modelName: "cactus.scn")
]

class UserPlant: ObservableObject {

    @Published var plant: DropWaterModel = DropWaterModel(
        id: UserDefaults.standard.getPlantID() ?? 0,
        type: UserDefaults.standard.getPlantTypeName() ?? "",
        modelName: UserDefaults.standard.getPlantType() ?? ""
    )

    func savePlant(id: Int, type: String, modelName: String) {
        plant.id = id
        plant.type = type
        plant.modelName = modelName

        UserDefaults.standard.setPlantID(value: id)
        UserDefaults.standard.setPlantTypeName(value: type)
        UserDefaults.standard.setPlantType(value: modelName)
    }

    func getPlant() {
        plant.id = UserDefaults.standard.getPlantID() ?? 0
        plant.type = UserDefaults.standard.getPlantTypeName() ?? ""
        plant.modelName = UserDefaults.standard.getPlantType() ?? ""
    }
}
