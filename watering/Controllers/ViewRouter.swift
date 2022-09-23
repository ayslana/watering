//
//  ViewRouter.swift
//  watering
//
//  Created by Ayslana Riene on 22/09/22.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: String = ""
    
    init() {
        if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
            UserDefaults.standard.set(true, forKey: "didLaunchBefore")
            currentPage = "FirstAccessView"
        } else {
            currentPage = "WateringView"
        }
    }
}
