//
//  RegisterUserNameController.swift
//  Watering
//
//  Created by Tales Valente on 10/02/23.
//

import Foundation
import SwiftUI

public class RegisterUserNameController: ObservableObject {
    @Published var personName: String = ""

    func saveName() {
        UserDefaults.standard.setPersonName(value: personName)
        
    }

    func isSharingButton() -> Bool{
        return !personName.isEmpty && personName.count >= 5
    }
}
