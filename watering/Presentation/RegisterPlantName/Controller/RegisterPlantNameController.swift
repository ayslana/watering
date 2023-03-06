//
//  RegisterPlantNameController.swift
//  Watering
//
//  Created by Tales Valente on 13/02/23.
//

import Foundation
import SwiftUI

public class RegisterPlantNameController: ObservableObject {
    @Published var plantName: String = ""

    func savePlantName() {
        UserDefaults.standard.setPlantName(value: plantName)
    }

    func isSharingButton() -> Bool {
        return !plantName.isEmpty && plantName.count >= 4
    }
}
