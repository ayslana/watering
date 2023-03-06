//
//  PlantViewController.swift
//  Watering
//
//  Created by Robson Lima Lopes on 10/02/23.
//

import SwiftUI

class PlantViewController: ObservableObject {
    @Published var selected: DropWaterModel = PlantsType[0]
    @Published var isPlantSelected = false
    @Published var isShowingPlant = false

    func savePlantType() {
        UserPlant().savePlant(
            id: selected.id,
            type: selected.type,
            modelName: selected.modelName
        )
    }
}
