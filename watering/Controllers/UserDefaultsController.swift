//
//  UserDefaultsController.swift
//  watering
//
//  Created by Ayslana Riene on 26/09/22.
//

import Foundation

extension UserDefaults {
    
    enum UserDefaultsKeys: String {
        case nameUser = "nameUser"
        case plantName = "plantName"
        case plantType = "plantType"
        case plantID = "plantID"
        case plantTypeName = "plantTypeName"
        case lastDate = "lastDate"
    }

    func setPersonName(value: String) {
        set(value, forKey: UserDefaultsKeys.nameUser.rawValue)
    }

    func getPersonName() -> String? {
        return string(forKey: UserDefaultsKeys.nameUser.rawValue)
    }

    func setPlantName(value: String) {
        set(value, forKey: UserDefaultsKeys.plantName.rawValue)
    }

    func getPlantName() -> String? {
        return string(forKey: UserDefaultsKeys.plantName.rawValue)
    }
    
    func setPlantType(value: String) {
        set(value, forKey: UserDefaultsKeys.plantType.rawValue)
    }

    func getPlantType() -> String? {
        return string(forKey: UserDefaultsKeys.plantType.rawValue)
    }
    
    func setPlantID(value: Int) {
        set(value, forKey: UserDefaultsKeys.plantID.rawValue)
    }

    func getPlantID() -> Int? {
        return integer(forKey: UserDefaultsKeys.plantID.rawValue)
    }
    
    func setPlantTypeName(value: String) {
        set(value, forKey: UserDefaultsKeys.plantTypeName.rawValue)
    }

    func getPlantTypeName() -> String? {
        return string(forKey: UserDefaultsKeys.plantTypeName.rawValue)
    }
    
    func setLastDate(value: String) {
        set(value, forKey: UserDefaultsKeys.lastDate.rawValue)
    }

    func getLastDate() -> String? {
        return string(forKey: UserDefaultsKeys.lastDate.rawValue)
    }
    
}
