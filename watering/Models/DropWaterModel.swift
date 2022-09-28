//
//  DropWaterModel.swift
//  watering
//
//  Created by Ayslana Riene on 20/09/22.
//

import Foundation

struct DropWaterModel : Identifiable {
    var id: Int
    var type: String
    var modelName: String
}

var PlantsType = [
    DropWaterModel(id: 0, type: "Flor", modelName: "flower.scn"),
    DropWaterModel(id: 1, type: "Suculenta", modelName: "succullent.scn"),
    DropWaterModel(id: 2, type: "Frutífera", modelName: "plants.scn"),
    DropWaterModel(id: 3, type: "Cacto", modelName: "cactus.scn")
]
