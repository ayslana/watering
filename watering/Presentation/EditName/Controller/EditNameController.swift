//
//  EditNameController.swift
//  Watering
//
//  Created by Robson Lima Lopes on 17/02/23.
//

import SwiftUI

class EditNameController: ObservableObject {
    @Published var userName: String = "\(UserDefaults.standard.getPersonName() ?? "")"
    @Published var plantName: String = "\(UserDefaults.standard.getPlantName() ?? "")"

    func buildUserNamePlanceholder() -> String {
        if (userName == "") {
            return "Write your name"
        } else {
            return userName
        }
    }

    func buildPlantNamePlaceholder() -> String {
        if (plantName == "") {
            return "Write a name for the plant"
        } else {
            return plantName
        }
    }

    func isSomeNameLessThan3Char() -> Bool {
        return userName.count < 3 || plantName.count < 3
    }

    func saveNames() {
        UserDefaults.standard.setPersonName(value: userName)
        UserDefaults.standard.setPlantName(value: plantName)
    }
}