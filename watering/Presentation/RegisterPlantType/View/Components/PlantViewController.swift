//
//  PlantViewController.swift
//  Watering
//
//  Created by Robson Lima Lopes on 10/02/23.
//

import SwiftUI

class PlantViewController {
    var selected: DropWaterModel = PlantsType[0]

    func savePlantType() {
        
        UserDefaults.standard.setPlantType(value: selected.modelName)
        UserDefaults.standard.setPlantTypeName(value: selected.type)
        UserDefaults.standard.setPlantID(value: selected.id)
    }
    init(){}
}
